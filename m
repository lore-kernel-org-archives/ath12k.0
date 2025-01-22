Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D47C02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJLJV6ONtrcfpP+rHoQCYGK0rdyIfz89lUUHS2Gm7t4=; b=h4ohwTN1o9hdYuSUMqklAePMN0
	f4FxbzUOcWV5lmZaAGr3PxKLpRYhE9BvZX/gwBLEUlcx0qM0pTNY0B1YbvpPEXwHVYxaEgWXHfoD2
	gv3FtVP8kDU0mjywlnIHAQhwqPeOJRaFp6aliu3PQeGc3vNXD3RwDnPmFOL/oM13Af10DD4X2rq9t
	rq3ds/qNNkAAByYPJ2p5BHhkH7ZId1rYuZ1QixE1ThqMkG+gbToX3dcmDZIsAj3oTVTIaYYV5i66W
	ZUaIqIA8mYxMrik/dZoiPof8oPE6NFyHhpKMpYfxIx6aRIyNiSVawE8/XMBRXUMbibgN58/o6YOja
	2VxqFLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafaK-0000000B0Bo-3EAN
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 18:36:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafaI-0000000B0BM-3fx4
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 18:36:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9op3I003011
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 18:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJLJV6ONtrcfpP+rHoQCYGK0rdyIfz89lUUHS2Gm7t4=; b=i9sTW0Ep1wKdBedW
	nrTn1CI6GaeLCyUNrebWO95lZpXU0gwWxm9zAI/rWq5k+vXAanZ4wQpttZ7PZerR
	SOMinEMGQTLy0jfd1FIVM0lGy3V6xDrbpXwuH3kX+79FvIKGTlLKnFhL2D+o8eAD
	JOr2uSkFgDQ/9iV3YgzCKYgs0nlVDWaT29Xo1RvG4xzmb4VyLqhLh7tQp4IOf61z
	Pa95gp2JgFgClI0RZXyGoDTkSsCEdexrhNooYpeU3tvQhHea/NNiefYRHNQGVhOi
	0Qyxn+8dLhzClW0kpvooH3c+6suehsJQgC/OeKNiNkRTwsmG+sPFiSzZFNIBiDgd
	w7HKug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44axd8h95t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 18:36:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2161d185f04so100615965ad.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570973; x=1738175773;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJLJV6ONtrcfpP+rHoQCYGK0rdyIfz89lUUHS2Gm7t4=;
        b=NOz3FvOQZuinpW9irMo7CoBQLe+MIrqtSz46brWSBT6IhvvhOXCbcQ4oU9clEPKrlo
         oWPVCVEidXx7Qk5KvaSVG4nicVk7hqbluXe5BS2QVoINw9Z5BseeCqKA0FU4ayvDnCRG
         3hNGz4DvNWkVe6HoPvnOToAuAuRodz+LNsFuTifIm8BaGo/zUD+ekweNO0kLez4iHqNG
         c9WeQ/BaVpCyYJ6bUsXIolAEk/2glr4b5+/W9l7rvJvAU2VCAsiTOHf37viXRKxux0g4
         +eldJEqKL0aqJ6dvUZX86eBxgl4M9M8LBiNcd0RinrKJ4Y2IzFsoHqCvxHLB7oUqkGoS
         hOfQ==
X-Gm-Message-State: AOJu0YylbuSAN521rIGLqxwF92Q+7nrEwFTcqWUhUIs0J+zHLd6WlhJn
	QLut+6MM0xd0iG504u5GwFLAnJG8OpSvF5cg6oXZtUjv9FeFI7ZsioH74HjaRvkhbRjpC/Dc5mJ
	MGh0xWn1sOxxctsyHLImcfm3Ju+tLHLUFTfCWiwsVAB3rWjLzYT/QLFEeria4
X-Gm-Gg: ASbGncuquZsDHv+16CWaqu/ORIldBkkMv+4E1kod84eBLZQnkOAVTvJ1EMnpO2l51g0
	rPkZnhGdDIxKUc8lDy65Y2+L99lQXLtnVz0/3tFkSiFIwjgJWL/aL5SDoOkPsOKCcIOggZP4//b
	NHtzxhqtfMGgRmlvcxvkxFe8Lsblu2ALxEcM1EDBgANfCgZPwB8yjzOs+TOjJ5/6v4TYpK6dtQC
	Yt29O6rj9sUylcURK8qD7WxLZJzMmKZaxNEfwuOXz3g5l0gn7qhWT/ykywFKyOpt3+ts9wae7kR
	3bMA8pIdSCHYBocnkJcUMAYvfTjR/K0=
X-Received: by 2002:a17:903:2b05:b0:212:4aec:f646 with SMTP id d9443c01a7336-21c355a4af4mr348553455ad.33.1737570972640;
        Wed, 22 Jan 2025 10:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeYqvxZz2gE0tf6uC8zNL0nYsBquftdA9I/M4H2x39XsSIh61i/n1nYMyBJkJG2jhFCbyQmQ==
X-Received: by 2002:a17:903:2b05:b0:212:4aec:f646 with SMTP id d9443c01a7336-21c355a4af4mr348553075ad.33.1737570972213;
        Wed, 22 Jan 2025 10:36:12 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea1fdesm98146145ad.26.2025.01.22.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:36:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
Subject: Re: [PATCH v10 0/4] wifi: ath12k: Factory test mode support
Message-Id: <173757097158.4048395.14541165281726073253.b4-ty@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 10:36:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: PhK8LCRPJnJeSoYXWr1RndVSya6eq-gp
X-Proofpoint-GUID: PhK8LCRPJnJeSoYXWr1RndVSya6eq-gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_08,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_103614_923582_4CCB9F56 
X-CRM114-Status: GOOD (  10.40  )
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


On Sun, 19 Jan 2025 14:06:53 +0530, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath: create common testmode_i.h file for ath drivers
      commit: 6fabed4052176a18da9519fc14a18897ed4f820d
[2/4] wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
      commit: 786d5258faba099779fe0d14d344893f9215d6be
[3/4] wifi: ath12k: add factory test mode support
      commit: 3bc374cbc49ec39891381d2e25d81a6f74fa3364
[4/4] wifi: ath12k: Disable MLO in Factory Test Mode
      commit: a93185b708f259ace63414b8529e9e15c6323b69

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


