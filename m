Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C6C61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS0NIWTM3JrJGBjGluv4xbhX0KnwNUBFBKu9ys0379U=; b=0lh2GibHtBnGrArNVFGqae87AJ
	HjI5oYnaA1imgKXGirmP6ImOpmQfk1GRP6RDYorCBTqBdJqIkpIBNhAqRkWrui2MKQqj53viOKswu
	LB8yw2Hc2eF8yVxS5x/vGwJsR4EG3xcIq9QscC4PMCQhdwOml0T1hg23Glq3ib847J7SgQNHawe8j
	oHhgMWh37/j+KMPuCXECaCllU8jejbC6M85tC8+ZDm75HrVUgEheWxUV3XfRAed25t2cwQnGu9Kgf
	9SXQD5qZgpdOFqxLvgu2Y9eQC6Rxtij3L7K6XHdxwe/EHZuqD3D1WnED+n4bzPGeQKW4rIZQGONmq
	ONPEunnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chz-00000000QKB-3WAE;
	Thu, 03 Sep 2026 19:02:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chw-00000000QHz-49aJ
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3dts820122
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JS0NIWTM3JrJGBjGluv4xbhX0KnwNUBFBKu9ys0379U=; b=GMp/Ha3YtJCLXUGi
	6vHzjtayKL9Ndl3HsOm+olC8svilygCt2Mag48yDRA2KVW12QWA7Gq8uQu/+vIB5
	2Dgtzy+wHgUlodIVk5KQfBKgQ6BRJNslVga/vKI4PhzSPvvbpFHvHX9ifHNlEhAl
	FqWaAQgsFt4IxiuZgJA18FvE//5AwwA2wrMb0KlojBiR3K6MPD6SN+EiUin8mfLo
	v9DBbblBpO2zgRMh1VowRnHx3J8mZgZj2YBcwJ5QrEcxiW2xxcnXTo68pFhqR+S5
	LEhHrZxfySDUn7rorQs4QO1WiPy6KNfFLbUJqmPLTef5uDIH8iJ1kx8dbeAAuaJ7
	ZjSuxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka4bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so317334a12.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462163; x=1789066963; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JS0NIWTM3JrJGBjGluv4xbhX0KnwNUBFBKu9ys0379U=;
        b=N9W+tNoGNDyVNspSa0egyonVQxSeqqsi6/eCOt3oXTmIcEnxU2QpkiPhfKp0estOsb
         zn1s+NPupmutKjehtBXc+STZDrchpJrYMdDS+2J1HXXz2MnWSWnwttPuaWTo57M5569F
         kWYM7EndMLp3NBxCofXu6CtqhxtUNyCrQLe6wm2yw7mDwMKY/wcTYS00fa/TFBXBVBnQ
         9qsN81Dyk9R/ZthP1s/rObn8wWQ9vbt29U5xs5g3Xlg/FDavBb0jWT05M90mRorBvb4U
         LLN13t5u8o404gI2ryjN5vPcsSbm4X5Pf3Bs4IlMhKgLr6UOIyPsR9aXcG1Zt3GunvXj
         RPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462163; x=1789066963;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JS0NIWTM3JrJGBjGluv4xbhX0KnwNUBFBKu9ys0379U=;
        b=ioD4Xxdfm3K78zFHI0rvP/2QU2nb5Wvcn9sXDbLmJ/v0bsQKJPi5Lj699n55jkYkM9
         MorXu10J8MfX9JUjbDZi4vvRq5fzDtinf2BGdmr90FX25AchdelUc69KpcUEsyJVOnif
         ONsp267K6BIMiRxbPlFIW9gvcdaIydOTlomlaBH/EWtWWdcNmd4zhK0RplMsyrqPZMlL
         X626Jvcd6BbCYIZzgoWdMCOgTV66bUw+U53U5Gz5GcOvTwDpN6NTavucQeMraHyqP+Y8
         UKROOXogfWZkB9kM2hAuHxBbbMzqjBDCZzbiQJkpLmXMKKFtdQFNGOWU2ctb7T+WZGfM
         jgWw==
X-Gm-Message-State: AFuF++l+FqjTj9AwXn010tZAsEQoMgRZ8+Tahbeb4xstUY05PzLsu+DP
	adNmh1UT7cpXwAjflG89YMrFWgA0sxo8sLsRNzGwzW0kpnVej/opKxrD3FyrT9nuBatoxAQ0sWX
	qP37yNRt9pE0QtRR0N4XhVqONY+Tf85/9v88gQaTR4urbnQE8v9+BSLwGOvaPUYIm5Vrw65fb
X-Gm-Gg: AYBFou02TV/0lWG+Be7gWASYs3eaF830aTe5chVIZPUqh+jeX8MHFnNtHkT4IcSDKxR
	bkLLzP62/pPpP3SnJlnYp1QokK0L+RFOW5OqrIjBVW36Bq1pSTK3WdKCzQKtnXtjFNibSlt64dc
	XU02Bhg3KsXyY8rcUUi5HgmMQ7lHxpiRNRi/AjL89g38fxbJr88aAWQ6wFnK2Oc7SLEZ7mu042q
	Z0r9EJEY3gjI1Ow0z9qOSKPddjN/XwXIalgmFutH3dxkHt8HHHkNIV4qCt+B/xUuVjDn27TEsUJ
	DGiA3vkCllAOMerzSmG01134IQnmtwabypGUc3jIBxQ5CD0/XUiPKzGNG9p02E8xqv7rfu0AMfF
	QT9jDNAUvXacqH007ZToWW0wPcq84xSBxwC28bfALjUWvkk8LAYWNGkQ=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr901772a91.16.1788462162714;
        Thu, 03 Sep 2026 12:02:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr901642a91.16.1788462162168;
        Thu, 03 Sep 2026 12:02:42 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260810054452.3245263-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20260810054452.3245263-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: add entries for Rameshkumar Sundaram
Message-Id: <178846216129.824911.3056501695411395646.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HRgcU62v7vpnVHOEM707D3N2JBCNgA8a
X-Proofpoint-ORIG-GUID: HRgcU62v7vpnVHOEM707D3N2JBCNgA8a
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c453 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX8Vp+JtHSdlhw
 bIOY028xTiYA2q52golN8DKTlPu0344HmxZBq4K83zXH6PbDFy3w4PSLQ9HHgjT+cYT7h9iQDGY
 J2jHWh4jVQcEkUMnBgRqSG/x4oy2z/l4gbgKNUFB/XCUAIkp+AkNpt7TmAsoEpq7eb/7Ow6cLI+
 8AsWGHN7sXRFlcE2LN7u85i2baM4QZ0om1LtbVnJD4NHYqs8HN7bwO+xu+FiU2PjZ3HZfziv8jj
 ZQ5WM69ChIoHfk0qcOHaa/0Q0RaOv/K3o9Jnxn58jmYkKCRcOVudy4lvVwK8I17OmXtRpTnczk9
 Yf9Cbuldoo0JSCKA6v8o6Po/7b7bORC1TW4V7gNu5A8w+nsC2scg2EJlRI/PD1WyHgmoTmNgeAa
 v8FtFZNntDizKisRdmZzjnTZJBsU/lRPFG+zqFZLLjuMC59fLvwdaDb7fr/H2khwy8Fuw+uVLTE
 CkKeVd8RmrIQo8gZvMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX5tVUmSCQf6/Q
 EcK2l3jpA/UxNWh1v07dmFUrJ3+sCe47ufNWitMH8KSopQZPxOI7XTkFlgW45Z5h9kC/es7uMtQ
 1g1xCk+F5A6UseTFQmaQXae27wa//Tg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120245_285548_78A272BD 
X-CRM114-Status: UNSURE (   7.51  )
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


On Mon, 10 Aug 2026 11:14:52 +0530, Rameshkumar Sundaram wrote:
> Map past iterations of my e-mail addresses to the current one.
> 
> 

Applied, thanks!

[1/1] mailmap: add entries for Rameshkumar Sundaram
      commit: 7dba43536f743eb93aec1bb4fce2c0f1495a6680

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


