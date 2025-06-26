Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B53C83000
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H26vxPDDq+45HdVk7MgggFQ05RRmGtxq08BAPOL5aEM=; b=a22U2eo1/vBNLT1Yg+vQ0PfFge
	tXPKnCoNXWwWEQL7FgbxFvENr2+9YN7WznxxpT/oYtk58PaBOUSD640uL/uZ6fXyVFxrUozlzEqsc
	f2LUDtgc99fKrT+afOXgg3Hk29avQST+czYrjdxhMWO7rzCvCVrZBHzJVwIfBc1mGV0W1NDMwRD0P
	wBpafxVS+xfIlsC0NmYQ9NY5b3nrLQ6C7DzjJkVIEkl7gkko/p5+raqBHJziPiUpFka5AbEH9sPPp
	Jkfe4BKKHFPnQtJzfhQ73f3mxVXCA6IjaajjerWZoTMjuvm5af3SUb3b3XaNTCFtvzCnL1UJK7rYo
	9IkpX8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuU-0000000DCRW-12eL;
	Fri, 27 Jun 2025 00:25:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoV-0000000D21x-17G8
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKAWqb014018
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H26vxPDDq+45HdVk7MgggFQ05RRmGtxq08BAPOL5aEM=; b=X5i/TOi4nWVDdWog
	okhKpoV77N44ftlUgo2eqXrtNzVnp0J0h9ubCdTgiDt1pkM2YaYSerr/0Ci/Kb0m
	JuySKnwJrOUaNmS2Rj6/X/7APDerAogX5/LCvKK7Q4JvlWt4lHB2LmVdFBI/Utx0
	lJA3vk/6VxWo3NzWEo5uZK0FNBopVhzlkvmtaZKTf0H8+ZzbsygdKNEsxfoaoM9S
	J2c7/mm3Ln4b5l2QvgQOQQjeTWerZJjO6UY9qPHcvgBi0JIwLCluw0H9g1m1ormN
	QRZSqbAWYSaEIxHb1tawtcKjjhBVafudpsSGGIQVt1onOUw9j3EMuwiG7OSU71rO
	DWcang==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmt3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31215090074so2356858a91.0
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979721; x=1751584521;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H26vxPDDq+45HdVk7MgggFQ05RRmGtxq08BAPOL5aEM=;
        b=JTY1/sWnLbs3aH8jekCV/vrp3/TAn/8cai2uzfA9KPi3FlMmhzaoRsbiwlVCF6V2bl
         HX6QPgW7ZTRqcOQLkqYZ0JFJuB3Z5kFB06MjXQlGgFIz1lFWmLOI17x79wVHw3hUeBk9
         DV3fdy74b8Nn20dhKXNjeiRYk5qRqVBYx6OSxRZInLn9uNhi14PIxi+M+GwTcuK4L1mJ
         zDujgpvSSxomkM+7zlZHyuvEybFV+J320pFXHg6bwD1hSspgLHEvQ1Dv2bxJAykfXyor
         eGcKdV4a00XufOvmzXaU+ZjaTFOH34ZiGi+iL0dBRdUbZl/H5cZDsyERemFMstwPMbFY
         Vr9w==
X-Gm-Message-State: AOJu0YyWEJrWlLJo8vHqPTgzT8SP+CGOfF3n1brTBZ/uMpsL2SLcs42K
	H2MGdL8gN9uWMVZvQK06JHvuKqUGMSil2yX8tJMrCWAjX3MfrhMZhFnCrmKmSGwUX8kxINGPctK
	bdLaJ3btABOw4LzzWZqrcgjjDCUJMS+101WVPEmc1hqDd1JX1JXoq6LikJBB2rch/
X-Gm-Gg: ASbGnctiPBl1v7eM2JF0BxWgrgkaApRXvgkrZnstmfEHyIGsMRuxfAPNx7YhKWLqaMV
	hFfCQFvaV0+70WTsEkqdNc6scxASeBJEtekVUqS6HSjByvOBd/8Hu6yhBqZ9SnfeWvUsVpoA3BP
	Zy9XXPmKkN/YQEu8IIlXS/370hJ5owaQIQFqPIGGzirLi0NLlpjQLF8272PfSFKbqtCrWpPCkK8
	dtR/ZACtlZEXGDxZKv9CPgPZPEG+NcjVHiODx9jMpPAtawHV8PT9DDp2BzC512R1KBFtKFLkT5o
	MeTr+n/y9WxbFuo0yd7g2USYTEfsZZqkQDgfO6IBYDD6Y1oLd+0oTwrY0nU=
X-Received: by 2002:a17:90b:3ecc:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-318c8ff22cbmr1173009a91.3.1750979721253;
        Thu, 26 Jun 2025 16:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqidKcjAC4nR/68Z/+1APw/4OSLlwWrzEMUEAtOi7Fsn49vHdOdDvFV4Ta+JWW+3IzNJFt1A==
X-Received: by 2002:a17:90b:3ecc:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-318c8ff22cbmr1172963a91.3.1750979720804;
        Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Saleemuddin Shaik <quic_saleemud@quicinc.com>
In-Reply-To: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
References: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support for transmit
 histogram stats
Message-Id: <175097972023.153431.8301439641819737889.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Od9C7zc9t_ZYeRtplXowAbsBqdavffvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX9d8z7zHP8POp
 bW/0zqJiIqMDr7+B9FcdohmaN8/bXTTuqbszL9PGAwJIoaZXpsT8Irl+Wx9nmrJQGJALfT/nfe+
 +TIQrsNFKwguBSkDsoSFx+R1Q5vgCIVprFA8Dfdxu0FVm1yWc+4xsmwUI5KOpW9NJ/SAXxwxhoQ
 AZ4Jdyht40xPMTNbi4NIVDUrfzwH37tTGI5uAGJ/5sJnsF6tUPTgGBgqeEK+avtRVYWmDEQdq19
 mJ/MCvL+XyAu047T7A1M+bGkUIEE3mwH+cO0nhPkrnrrwpIgadWlTMEWdNzRIPOgY8IUkxTVn9V
 nSwu/alWuuRc0/g1BcG4+/oIkQNqSWlyVA0CEK740sl4L/gfuZBgLDUmyXRvWs6vaK9Rpd+jtty
 I/PxsqnhUhBT/fe0wzzycptLQerRHVxBydh4jCwfjqxtKiT5QuCdtvglUZFax4ihv9GDFmBL
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dd48e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=MMKcxVdVYhlKfOLOBpoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Od9C7zc9t_ZYeRtplXowAbsBqdavffvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=991 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161527_431920_8DC6A87F 
X-CRM114-Status: UNSURE (   8.75  )
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


On Tue, 17 Jun 2025 16:51:39 +0530, Roopni Devanathan wrote:
> Add support for transmit histogram stats under HTT stats type 9. These
> stats give information about drop count, MCS drop rate, histogram
> count, etc.
> 
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not support tag
> HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG(144), currently.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support for transmit histogram stats
      commit: ffc7adb0a121cd72a02095106bd006f44593ee35

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


