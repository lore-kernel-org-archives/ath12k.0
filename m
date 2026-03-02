Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF9DEB363A
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J96wQHk10XbuuGaKip9JcOJCisie4ggrztVEg1mYn2Q=; b=TDL07NRSGPvgxJ7sRUeENoMWsh
	h7PldZkRMJZjz4ORjMb81ab8CarsWxnegZUiBmXdeSSND3jIpxrnxli2IRV7K1QAXYqPtADpcKbsH
	ESui2nCERA/m5kQ0p9Cw8KDslaXJgBRRIkszhgvA9vaRgbsX98rpNFxH75S1dNnJT/kvNpd5bAdkN
	EhQ5+hHOKxu3Z4ZEWQ2pjijUft3YRLf4OGhfqET0beiKPjTD3CL8yOl3Qa94HS3IYbSUL6GtbPrJp
	abuiWvWdWEVgXuoDIRg8yY8Ccv0xZux26nCUhW0WgjZmCV5NcL7N9B3dJPqe1QRtJyv/Q2/6kcPs/
	lX/eoUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUN-0000000Dzu2-2Y3a;
	Mon, 02 Mar 2026 21:07:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUL-0000000Dzt0-0IS9
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 21:07:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622EJHwm662205
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 21:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J96wQHk10XbuuGaKip9JcOJCisie4ggrztVEg1mYn2Q=; b=OtgISUotKfshvwFK
	2Nym3G6CR1xXbvVebc3xIJsxxitleo81vdVAgV/3Kj8txPo5JewV1Y+abDWe7B53
	9rmPDvGLBEAxa77v+JBM0dk4JYfdkJvrRQXXSWp2F8KfEH6nX4YKxL5c9VJ6QL/X
	91h8NGKntiUY8Kn2+eiTeDNLT2rGeXxvp3I9sp9iwwUGi05lHKgIssZUY8EaOPKP
	jt/Z8qHV7l3EdcX6iU7pBdogIAQfZ853dTPfTc9VyLwpHt0mmgn1ISG3BUbFplel
	4OM7G7+cn0FU0vlk06UqecWW6+vjQmmAGBf4CSZvvDVrMnO+Wy032ZBQRL3b5YP4
	eXgcDw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2tnjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 21:07:36 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4d4db1523so25954627a34.1
        for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772485656; x=1773090456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J96wQHk10XbuuGaKip9JcOJCisie4ggrztVEg1mYn2Q=;
        b=TklY2GlhDn3ukBUq3mhA23TuWOcnAJped51kN/nFJ5eOyD+iqU9Mvd9CUeMPqCFPNH
         /5Z2IfDxXu+Uls5wtsNymvBMaZnUMmsQmJq/oQVThPYuUO7ZsCl6YG0//bG3ugINn2TO
         Q/p/Ls8nbAgI4EmX+KCV0Tj5dOZkTuJDuxt2v1hW31+1rxn3NG13UV9pepTmnq3y/dgy
         NbUgtAw8sMOBNAZagLKfOx0sWMWt8qTqPB2XqnN/5tgJ+0n0xozkN9l6OS3NdKHnJAwN
         2iuvv/I2OISvF0gNv1O3i00F9sQwiXYs1nGWihGoxRcmPUwJc3RYpk4Y/cWSR0vyVA86
         9TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485656; x=1773090456;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J96wQHk10XbuuGaKip9JcOJCisie4ggrztVEg1mYn2Q=;
        b=eBZnjr/87o8tKaE9qM52EUp0BHNoXc37/YdSkF0mVm1Ic9wrhxNUwxDwY58/mPtwH3
         zVApVf7/XDBYQQoAqrShPIFbkaoasBq2sm0v7krNQELsrYKcEUg1X986klHsZND1dxQw
         smBFpjLl/zj/RdWxrOs2uxmF/911tIxtcCg7bE4/7aJkunfiQaSfQHDTVKEaXMYHAtpX
         8cOjuqSbGoUHqZIVnymOTY/LkOZ9LEK1EGS8hl78an2PSDOqsJW4ESe4M9dkky2Z1G8X
         pEgTBkWP+4OQVExSXU6c1dMVc+zc68aZC8KS8N8QbrAgYyIUutP20ehBOzq8UafA0/QZ
         ccbQ==
X-Gm-Message-State: AOJu0YwR3t5qLK9gck8J9KD04aKHXoJyQuc6H9fZ2WHPW8tZ8rTNu4dA
	TzV/hdYZzDFlcSaF5BcHgoOSSWN2rFQ4g4Wm7n+PpUlKtjNg9iYQIYVv4n/e724KL6UqvwTNJvC
	DY4sVxHmZlRbaJMqSclxtaLKeDenj7RBdby3AM9h7YcyAMPC4804k9sl7R1o03V9v
X-Gm-Gg: ATEYQzwwPRAhyyJGbfJ0C9hUug4UnX52mVds/uLDgqBTKkNjbl7cHBGn/0Uzx5u0/CU
	Zw3i391N3JWKwTDD7CEcSHxbcn4J6Wh40s/9uQydNN1RuZwKWJDmlqj7p+Xim8+A3JLL5aFmwRW
	GJ72gWzoSNDx8ObvLDVqAxaKzCBi6+SmEnqqipcqd72c3btGQSIW/ZCEEa8kaOqM3K/5Tj9zdHx
	A8sJrvRwCyUo/7+f9bxcs5tRMcNES8h4Kf5wMYlr72NLDuFKkMJSvTOmwx7MlL2PoXB6bzVJ5iG
	cKL119oFtVoYicO5J/iRW39x7SmbJ1MKuR0Hurb7Rta2ojsZ9Z2rNDe4k8S78ckc8gbBdIoHfya
	U4SwccFiyvw1z9IHpAaULvl81UaZ4WzjbhmZt6401Z0+Ktv1TdJg6AYl/QhxxMtS9wz9U04X1S0
	6b
X-Received: by 2002:a05:6830:64c9:b0:7cf:e3f3:412 with SMTP id 46e09a7af769-7d591bdc2famr7857181a34.24.1772485655969;
        Mon, 02 Mar 2026 13:07:35 -0800 (PST)
X-Received: by 2002:a05:6830:64c9:b0:7cf:e3f3:412 with SMTP id 46e09a7af769-7d591bdc2famr7857170a34.24.1772485655633;
        Mon, 02 Mar 2026 13:07:35 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5998bc31asm7449967a34.23.2026.03.02.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:07:35 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable monitor mode support on
 IPQ5332
Message-Id: <177248565484.1002715.11144133225824646207.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:07:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: usiHOLWT35BkD57XBSJgimwYzoXXM3Wc
X-Proofpoint-ORIG-GUID: usiHOLWT35BkD57XBSJgimwYzoXXM3Wc
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5fc18 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pVW9SppbS6E-DvIT1F8A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MCBTYWx0ZWRfX4RfSMLR618Qc
 3lGHyBEa8V/IQYMeylFebG4hlOgB33gn59mDAqaNHbX6Vur0iPZoNS/wz8pHHHX8R5UuJcEsUoF
 AqAkKSpKkO83D/KaTskRqnOXIgEnd+fMgLCKrcpvPWHOUl3w9nKCGnaQrhrhuePXMefc9PBmA1T
 P3OzmJ5RpFv2XZwyv28Dzh9yAmOMm6DG+JkoZ6RTQ9Mhv2jx5sP6uYECvGzml2qfA2WerIDIwEE
 6uvcHMvOrx78hMLClI1ozTIbrWr3t9RrijBGTAZZXwejeiqjScn0b9Bm6AK1GwfZsVApUS0F2Ay
 4MsmhS5HGhx753zqoCTVDlr9zbYMbJFeC4gfq8jTH/B6q0U1JvdRNPGC1fJM/sxqJA9x2JkNnpJ
 MyG8hl8aYgPYZEIAO9qG89yKJVBw8aKBVsKRbcT5xK3PFGrU8/jA2segstMvaP0cjJzEAvLGAbB
 AA9qagnErwi1X579QGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130737_140469_8A4339B2 
X-CRM114-Status: UNSURE (   9.19  )
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


On Fri, 27 Feb 2026 09:03:32 +0530, Aaradhana Sahu wrote:
> Currently, rxdma1_enable and supports_monitor are set to false in
> IPQ5332 hardware parameters, which skips monitor ring configuration
> and removes NL80211_IFTYPE_MONITOR from the supported interface modes.
> 
> Set rxdma1_enable and supports_monitor to true so that monitor rings are
> configured and monitor mode is enabled on IPQ5332.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Enable monitor mode support on IPQ5332
      commit: 80a1147469b07a384f6f83a26b31bcd63d6684c0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


