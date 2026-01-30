Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE36E6BF1E
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCj+sZ02Sa2PaRpZt20dwuF0yp5EkPLLEyveylPTWkQ=; b=qDdtlma92pzIUqDzcvj56qI+0M
	oUvGwtFXdoN9AehPSCizrLmfEbY+8CNYXLh/7+8kEuanLWFGU+BxBdyuwlLTrYf/cGAfUOAFIMlp6
	9TYO95swg/YG6m/jeFt/ZqZy9wYaGfEweNl+JWBHOvu/ey62SLYAMS2NtHF/dVOErc3HNy4jE6Cj6
	vO7f1hGv8bPMJEjyxty79UiRN1BRaFusayPcryN7R0QGxD6vJH94mu5c00ldxxNepCrWjs1uEFLcp
	9Tr/dUpR7xdMw8PRz1xL1RXsuLLinwao+Yio4dM5gfmKpa3TUuWI2yFeE3Du7AE7+kL73msTQGOMI
	RK16EOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDp-00000001cv3-2BFR;
	Fri, 30 Jan 2026 15:15:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDn-00000001csj-0Jhj
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBraKL2294942
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCj+sZ02Sa2PaRpZt20dwuF0yp5EkPLLEyveylPTWkQ=; b=Ok7QLn3J+zjRllv/
	k/ul6/s2z5hIiHtLZo62TSRON9kuZoUkcy169NPyj602JIPBeNArxsKm87PcInSx
	5JDPgnRUaThcHq4/QZ+NL7zkku9viCMocctFErupM6t52auhKmU3wj9v3ah7NT5q
	rR7i8AXCQOzeHfRNSDhAeLYuTqghM1aGCPtN3d53PH/eqJnEEpoUCuivcb9dKb6I
	pKKXGyE5ql1QUHPF6dZiTIR08WWqf1q923b+pTOWd0BCMkU69bFcBZmUk9o3nU8R
	ji138mQ3DMeiR/yDUEc7I0/UqwTylwx2cM2nawK//qalg9bOfsL9RCxN6MW1wob/
	SKratQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x9rvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b71c5826fbso2566333eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786141; x=1770390941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCj+sZ02Sa2PaRpZt20dwuF0yp5EkPLLEyveylPTWkQ=;
        b=B341OT9eZoq/jd1zojTj21olg3N1Pu9je5pELRzQ6yp01WDlqIABShdk28NROXEcs2
         lFyXr6cKWk0XxmZjPhNixFV5Rv46uGLyb5gHstgGUIbLxAChDbd+m1e1SILYnpOCeat0
         QFGL4+aUyaF7buerdug+w5ZrhdfHH1NG5MzP5u8D4JuIgHZzqJpAYmdm7N2rOtMc3Kle
         sqjNbyETvusm7U6qyXkEFNKAuXKqtsNNO+IKiOFztskvcEZC3vOdoArIyNw1SmSCmlX7
         UFIx2QgSXWFBPOwT7WKMwehMB661UwjHwBv7Bg1n1tkY9uIyg02N4Uikck7eXu3XjV/o
         DQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786141; x=1770390941;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BCj+sZ02Sa2PaRpZt20dwuF0yp5EkPLLEyveylPTWkQ=;
        b=do41YdRBt+FHZ61FEk2p8Vu1IToSem3Wkcw4n0DfQ2SZV25a5d1sTjclJ3UC1WtpM5
         KRpCrfeS5nWXIkjWau4rpf8wrRWoa+6e5bqz/bEpgAco2ctqzAV0wU2zrOw+hqK2qnlL
         5CvI40HX/4i3asOeK4kpMO9+eZIi1rvmwhJqWlAdk2TQts29bbPb0cC+l/VE1FoSH6ri
         T+hkDeNJQJU8iuKqCmgRXhWEI8Dh7Yz0ZP5zBoRpCafcd/zeuE0G+Hy/2RMuKnFaY7R9
         /rF3QytGWDfbjNBoTJAMCtsbTQxftL73cVHE/+6JKuYrsAERGvuj+zYQkWjR9XnBJ248
         98QQ==
X-Gm-Message-State: AOJu0Yz16ky/UZ6eiGBtxyNPtUcV954/HaCF+LsRyfe+9izxw2w83H/6
	LYyzhbyPrbxwJ9w/j6iU3c4D5B6XSJARL2v3guOzZ4wxjjCf9NFo67TIUztonrVCwB9PpCfS8YS
	XT2YvIqUgyIy9m6W3wGwrlUbjPoNjvBUYYJCi95AZzsbqZTYIMm3cnX3Ri3MODznE
X-Gm-Gg: AZuq6aKAqxe+5qgaVPzhmCvLj8m0GcHO7QyibUi5TwDwxGn0ijs3ESEqh+0XLnBaR/6
	x7224s5o67SDsSMzAYFvMF/hHPn1dooybQwgvCVYnPJeImn7s0LAzOS7/2tccDlFJ7F3hbj7PlW
	JrFU+waZ7zWmxeEXdOtpls6k+teWFHMH+HICLIEY9CjG82s7PB9LIC7RLi0SXsBVtm1qEASHyL9
	ErfOMMq2Df2AmLnvuqbWQL8EprO/4PwewreWzDV9pOOLRkydsN09kF+VjP5/Fzll7ZlaJqs5QeZ
	JQrdwWfn+QvcESl9dnxZ1arbCltSSmxoJuQF+PMzLKLjVR3rTE3v8DGLnnWuc97Iq6DTtByL5Yh
	//183+crQS6Z3emQM1F8KNcbjcYsbUnuN0IUhZxQAF7WqYzW00qYNVZdiidHut/u7
X-Received: by 2002:a05:7022:e98d:b0:11e:65b5:75ce with SMTP id a92af1059eb24-125c0f9ab5fmr1426117c88.10.1769786141018;
        Fri, 30 Jan 2026 07:15:41 -0800 (PST)
X-Received: by 2002:a05:7022:e98d:b0:11e:65b5:75ce with SMTP id a92af1059eb24-125c0f9ab5fmr1426099c88.10.1769786140338;
        Fri, 30 Jan 2026 07:15:40 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:39 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add support for RX pdev TX
 hardware queue stats via HTT debugfs
Message-Id: <176978613962.3951544.11329608705566152802.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Jkuu_8eXFzcI01iSrlUUW6Vx7bmSoKME
X-Proofpoint-ORIG-GUID: Jkuu_8eXFzcI01iSrlUUW6Vx7bmSoKME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX8pY3sgj0V0se
 K93yi/Q1Bvh9ac59B7R7zBCE0oZI5pnE8TL7eMCy2ACjJEH4bNR1WjZmuslvm4Se2NkpFXWPIwk
 5NpCqnEEQYVacRg8DfcyzwCYOlBBptE/hwLlH1VSG4RxWny4KN7VQ44mjOWaf+H4OODCW0EaRnK
 T0U5ahmFd1+qCZDAN+NvmmyDwzNtqxJ2KwIXew+U94TrnS1QMS6kwqwqDcwbCs6CNNIBtuFxvZk
 pSrdn0F91Lbrx1/U5jLHKth53DxPqWckDl8S0BXqWzi1CqeEu3+wVziScZyDz/y0NaD+apH9imA
 nRRXqwc3706mLhwr6vS26PTthM6xB6CArQ3WbJxzKjtBIl9T/Le8Xg/9DbTrOe7yywn+2DT5Ej9
 cEpgNprPdTFyaiAD21n+6ymfwVifgayGjBQKxY0xpArEyCs0W9PwWQWy0lkmaRC3ac/LV08e7kS
 v97UcDRBJ5n6sCYb6cA==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697ccb1e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071543_234233_15C26B92 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Fri, 23 Jan 2026 12:42:50 +0530, Aaradhana Sahu wrote:
> Add support for HTT stats type 2 to report RX pdev firmware and HTT stats
> type 3 to report TX hardware queue stats. Also fix invalid buffer access.
> 
> Aaradhana Sahu (3):
>   wifi: ath12k: Fix index decrement when array_len is zero
>   wifi: ath12k: Add support RX PDEV stats
>   wifi: ath12k: Add support TX hardware queue stats
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Fix index decrement when array_len is zero
      commit: e4763898bb1325dbb3792961b6d607b5c6452d64
[2/3] wifi: ath12k: Add support RX PDEV stats
      commit: f20de310882d3c9b0a051b30dc39d0b640cc9cbc
[3/3] wifi: ath12k: Add support TX hardware queue stats
      commit: 05e810c8cffb3e96f6b967c9a57c34d4a6a6347e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


