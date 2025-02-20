Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A680C021B4
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 21:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHYe/1J2KbbzqoHimzdyHNz0QBYzwKAZi3NaHlPEgDI=; b=YPA27zPvL8LRr0SWaKiyOFq1T2
	Q26WOt5PD3ft8sNm5Ss+Lec0+47j+7l0Xila2s+yRteZz3N83GeCofWyE0nbKQ8x8EKcHooBKXrwB
	IlnQGq4iuRAkCMFuX1P2wfFnKj50R/EPCOOJBkKHGMC092uYvqVRIMAsrSaPMnhOLemKWZlSqlk0Z
	JZ7Px8pCuV0C8FBU3jtZVw6Oz2x3PbakhgUv5oqeEj5JwajwoOpzPG1BQX/sELCnhbWXbNwjfjtnQ
	G+ao3Nm+iNJnABQ6bMZhufd92gfyZtQm1PhTiM7KRfsSONpf4ozV/iHpZO9ZU+xMX06ICyFmJZeh5
	0MeGc87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEI5-0000000306q-118Z
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 21:41:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEI2-0000000306E-0CnI
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 21:41:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KG14SA014993
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 21:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHYe/1J2KbbzqoHimzdyHNz0QBYzwKAZi3NaHlPEgDI=; b=E9lwiQkIf2FdAVEM
	aGymvbdTOrQiLH+BxvsK1OaWORI+wjHdFeOg4Pcbc0dn8J9lSNXcBNgLg8nOuPXV
	Rn3WALMvJbXy7LO/tzsgrOFl+rTDFXJOOSaelDmaBTPWsw7LOfCPt7DRmhZdkJHw
	9WJJsOPicjr6TEri3MB/C2Q9cFTH+guHzujfLZNxgZwyYMXXVXs+9KDzHis1sOBK
	cU/Ebnxp7J12HZHdAcAvM2E2BgW+U7bPKIOYGFAgOPMy2OYODWCrzcDTkdx+QJmI
	mHwNddwKwCXo2bMP7gBePvq1vn9WciFZksa9kaSHXe0s0V8Vsy6eiMiKEK4fq+Rv
	HrrxMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy17faj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 21:41:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220fff23644so36205425ad.0
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 13:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087661; x=1740692461;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHYe/1J2KbbzqoHimzdyHNz0QBYzwKAZi3NaHlPEgDI=;
        b=r9ooQ7WK1bj1c9m8v0z+W826V0Y7SxmpSSPI8urhl/LG+Oh9K2EqvroZ6UokQ86CSc
         hpe/qxaYTZpJr0LfmVCe7sVUT5DUscwgksmR1R0JA5kWucSse2O36LNL1uWIGB7r4w6x
         Md9fy+TLZOJGEIbu94uZOJteT33FlQcz9JDHZZziPO9ijxYXMmqcUVeGZbP0wDUILKw/
         SP/G5jlY3FEaR7ztqbu41vMOT1es/2gR5KkACGAt2eD5luNI7rA+9eXR7ravvlFdmxdo
         NEht0h0akmqo9i5fjkPIcUsG5GLetb9+iiWCB3iVuqP4SWGzRfbR0SFHWYajX1qkMIpN
         Fb6g==
X-Gm-Message-State: AOJu0YysZ9krWrt7drY757IOB3Y8EmcADRJFtILK7Mzrg/ERy4iiTIqS
	ielTvNGhEJQk569JQmJylqOavCXk8NjZFI25Z/zuvf7Ch72feM9sFmaND4YAZyS+l2QZuauxQvB
	fhvxt5yXAC5h1CyIZywzjo/BytBwJ9W7dMsknDdft7p4mDz1fn19w+Nl7usVS
X-Gm-Gg: ASbGncuIrUsZhPbZD3d0l+l8dsSnVWcl8MqMCV6R1/F6LS+b58S5KHz4HNvyZGCJZsY
	KZoQHT1CJtTtt/J4PpIjEbgFvZqb29bXEk/SIvBisJUciGdx4aBknKqxRsgysoJGJ/n2EQwm1pJ
	uZ6Y3mWuPJpx3CByaODOMJkNmh2vD09p54amuVNal3N1OOJfUDfScND2eCz02umIzVeI1smpElp
	0x7YVgPAsYItcPGfkbQXreDxIy/zpTZmw+3K/uoOT/LJinsHOrI0coIQMsguQw/feSHqrhwkDM2
	f8HPgtoZXrdGq7uXM7uwmbxs1Ikm/ntZdiQc2ovukg==
X-Received: by 2002:a17:902:dacd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-2219ff336bamr9115585ad.6.1740087660860;
        Thu, 20 Feb 2025 13:41:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBQEEy5oWBD6OVqZecVlD7B9fRRwgJ3WVEmw/fiaMF0hm9lsDuFxGkF9PrkJtkp/zbU0HKyg==
X-Received: by 2002:a17:902:dacd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-2219ff336bamr9115335ad.6.1740087660425;
        Thu, 20 Feb 2025 13:41:00 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf8fsm125252215ad.152.2025.02.20.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 13:41:00 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250124113331.93476-1-nico.escande@gmail.com>
References: <20250124113331.93476-1-nico.escande@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
Message-Id: <174008765984.757811.7713925396986427174.b4-ty@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 13:40:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: KNKrk-3xrHvHA-jQ1yKTjb7jiMAzlALv
X-Proofpoint-ORIG-GUID: KNKrk-3xrHvHA-jQ1yKTjb7jiMAzlALv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=931 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_134102_094302_EB244AB6 
X-CRM114-Status: GOOD (  10.50  )
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


On Fri, 24 Jan 2025 12:33:31 +0100, Nicolas Escande wrote:
> When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag to
> the tx_info's meta_data_flags . Without this flag the firmware seems to
> reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
> did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fbx: Add missing htt_metadata flag in ath12k_dp_tx()
      commit: af1c6007a64e78b729eb5a8d149637a820077bee

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


