Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B64C19F32
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=; b=mZGDbQQubOhSceC2bwMugdanN7
	el0yafA0uRR0eQqI4vP8gu5jLoVAB+c+F/gQvr6cJ9uBDOhUkSpN7BNwky59qXNun1lKycPiyETfP
	T9TFU/JykeDVv22YwoN+Ekxaprj+NdNYvdfAFdO7zC2J0Zjtj8Ajh7ATmn+Bv39syFHflmJlJkekv
	zSo9RXhNISZSuxXkBzH5Es1mqBkQ/S63hfquEWaxdY9KhQLAwWubYsquMVtk7YLuav1PABusoHeNX
	QMA/tUEueOTiCuvaKwYUCMaBBDPKzo5xX6DHY9Os33RP1opf9biUqcNjyzMuMlx6hduZYGfcmtrt2
	4VOdCyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjke-00000008aOL-24E7
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 19:40:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhOx-00000008BFG-2B2P
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 17:10:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAlaYB000441
	for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 17:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=; b=BERq+M6+nBauRddH
	EEW4jz44O3mA6RP8mXiK0q7+x58Wp91sL6LI2Ywy42Y7jSQyzKBAAQlE/z/ibh+w
	UwY0z9dJLNhY+75yX1jU0O0r/4w/hWAnhWiF0dOvnxlhbRkMJ7HT1eFLyltvw5RX
	2f6iw3TSrJrlr5WXauV5NABby1uXa6Oxcl8JuuluDFlAgm+0h4LT5CMN5u0hJMAp
	O7SymVQHZuP/1tSUDlvV9tM4sCgh6zw7gXkd3WxYBOYoCzRVrCIXsuy8dsQ11c0T
	IBKTbtWIXEiFXao3g81e2abtsAvDVdZ9xZMi5TGDkHMr4A45Pfegx8RmFtj9ns9G
	BOnCog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skvja4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 17:10:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22366901375so2865535ad.0
        for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 09:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740676220; x=1741281020;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=;
        b=KpDFQlYew3rSMFF2YeLICOF4PdpRwDFF6ULAA4qP9u7qIL4MVEcTGGsCR9M0Z+3mHW
         hwlujsSV+UqDSR1Ix/G/gbUvNA8OmwYiZXidV1qOVjGWj7gHoa5MJxIucsqHDJWIrMzG
         Z2Isa8rdkEIg+U/usj1tXOq13WdldhJVWTIMahgtmU5gnX+rbLykyKyfcrdQlw1ywa0G
         ePJAwc8t5ZBwkeVU78LZJVuA47QQzgsauPcg8GYmuKFRDcqvlezf1ZNlPtW8tJqQMnKk
         WOGGOT2F+hT43aurjHL8ndy4bf+poEX1WCqBvJrau13CMSFv7qA4IMQtaedmBd1F8U0b
         678A==
X-Forwarded-Encrypted: i=1; AJvYcCUUc0qEz62wRN9iH/ot5rK2TRCeZj6hEvw6uAgm5TxciOELVHcruHonEq5KZS6tpitfxUNk01Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUk1adcwasjCf6tBK6iFQtaXUtFDBwUOI+xRhqBgRKFooXfv6S
	iK4nhHyCjtGJCVBgsCgkmZ3zCeeFXA+Fx0sHsCmXiLtzMZYx+nhdR7aPy4qn3zAl+4QScRZW6vw
	ZpicZtZQ7KtC7rJ2uce86050JJcmM0Hdkt0MzFQJCVSxvBVbty+lWjMZ45xDR
X-Gm-Gg: ASbGncutqwHnxObDI32y364X9WpoEkvgbAmX79kwuMui1RXNyuFDU6FuIYGt74w5h4j
	Mmh1sYfmZjEH507zmep4eAeHUjcb66R1MkMjxUFtqnx1m9UrlzLZ/OeQxIZJ1qhALLrT6JMEGkD
	6sTJ7qddAyOloQxekmz78hY8pKVoztA6itUMLBXS+YHdgiT2IUdgMTp4PmY9i0BeJHKsyyvyCqq
	LbRc4Nvf3H1wKTmWe0on6tHXnqX/D/CMnkVbCMkhJivSz7YDcfuGIdyjtFNspkE+tO8c2s8qCnJ
	eUx9t9/4lhirBi1BqtTXnWFE1dpmzcoZUHjpD8AX0872iMPJ4dMH
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr8293947b3a.8.1740676220203;
        Thu, 27 Feb 2025 09:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgr/wxwNt0KZqGBy+I7l36MHGLD404qGwiZ4rO8yQRGGh2MVohZXLl3ovVhLQ8DhfSndYDw==
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr8293899b3a.8.1740676219808;
        Thu, 27 Feb 2025 09:10:19 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2a61fsm1896855b3a.8.2025.02.27.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:10:19 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 0/3] wifi: ath11k/ath12k: IRQ affinity fixes
Message-Id: <174067621913.3801911.12667754541994215143.b4-ty@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:10:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: VOLr_horgk5EYXPkO2Incn66i7NHtWhr
X-Proofpoint-ORIG-GUID: VOLr_horgk5EYXPkO2Incn66i7NHtWhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=840
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_091023_694933_D7FC9B8A 
X-CRM114-Status: GOOD (  12.57  )
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


On Tue, 25 Feb 2025 11:04:44 +0530, Manivannan Sadhasivam wrote:
> This series fixes a warning from kernel IRQ core that gets triggered in the
> error path of QCA6390 probe. While fixing that I also noticed the same issue in
> the ath12k driver, so added an untested patch for the same.
> 
> Finally, updated the irq_set_affinity_hint() API in both drivers as it was
> deprecated.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath11k: Clear affinity hint before calling ath11k_pcic_free_irq() in error path
      commit: 68410c5bd381a81bcc92b808e7dc4e6b9ed25d11
[2/3] wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq() in error path
      commit: b43b1e2c52db77c872bd60d30cdcc72c47df70c7
[3/3] wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with irq_set_affinity_and_hint()
      commit: 6f2d839d11b36c630dbcad2c68613f15409de392

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


