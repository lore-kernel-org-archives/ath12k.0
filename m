Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906CC369D1
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz/5RmEBo3xYPpjZX3PGMsauq72vwKPpecwWuOh+MFA=; b=LdU13kRXjLtaK7DqKVnttW6wWh
	lOxSDB725g/lHbZ10pg6sT0hqsWEQdMUnEOCJTE+XVNBUbJqeiuF4HAWA9+N81hXZgxjAC7/PSreH
	WGfFoOWtcB5skvJUHvbreg6B1apsK53MR+4cMKLKsreNO6KclOqEjx3Z07ggxgNajHKPLRqxd7Z39
	c+aUZgGtx+LuwujN0agzeegLwSCgNadOnTQ8cIA08gXHuIkngXl7zfkGZBcfb+UNnKswOwXsGYicn
	h2L6bXbaiVcO1rde0nnNd0FdVLjudlOz9X4C/WDv8WmnFZ+puKsmw6wps+NN6eJZ81TNzRsD130Q0
	b4TjQJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAz-0000000EVUs-3CtK;
	Thu, 17 Apr 2025 22:57:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAu-0000000EVP5-3C3z
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClRkD023402
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zz/5RmEBo3xYPpjZX3PGMsauq72vwKPpecwWuOh+MFA=; b=oRmebsEeIeDENBP7
	bWvC01eI+5mD42zRzxmCkPPC4rfiCmKpqcGqlBuV0MjjD0SLQPxnJombCjUSo4yM
	rHrDWroqjdqwUZsx0vm0HaV4eMvJZneMVOhiSR67GIDRSyVPANDN6lCljyotCLRM
	Qcr4Hw1cS5UfJqCtwbn8MFy2XBtHud+hIyADvIawApDha0DQX24pl5gT9Df8LLgS
	bNbK6LxYqY48RrmhZSqWJNSt79C8WqBSGRszDx8J/1YmFtg4xLCQ68NxKeB6dypT
	ez5lAsT6jCLu+2n12LRkYAjs9kNCxrNH2aPZJl00/y6m3wLBygcsDvoQbLkn/MDV
	3AYLSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq05te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22647ff3cf5so11946575ad.0
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930659; x=1745535459;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz/5RmEBo3xYPpjZX3PGMsauq72vwKPpecwWuOh+MFA=;
        b=iU88MrdLt9etAxaRHs8LVuX1fOIsne7nztRGBfaTzADJdbpH8jETPnwEgaTxkejaxu
         pHyDFx3HBCVDneKxN/21h9KZng3Dt9TjEZvzo+GklLyiSGMZxkEnBiNCgudr5pH8RyGZ
         3DomQBCBuBZH+A5fmN5c3boaVA0vBJ/SMb4afoq5iIhMHk+xY81Cbwd9WUN52OC8mqiG
         ygtMj1EimCWUu4BMd142+wZCRbnWZaoBUZxoXjjxWqjy1wT4IFn2TV0ahmH5BLu9PPJ2
         O4EdmywKAgu5ywrS/w0bIj8KVb4Apa6ea3cm7xD6FFg5e9luCTkR0ekpncaFNA4+DwY7
         O9zw==
X-Gm-Message-State: AOJu0YxXspOAtf2mTRIdtv5Be9GcbhfhO9zKJezOND7HdIEtDrhhjoeH
	mZlz3A5o+GriouhUtXlp0kQeVYECBAAyfgQKkEH0CsSJ+AstDlzfpeSL93hW7iMS/G6mcCJEurY
	sqImksuHTkxog7nZSqISQvwu8OQLAu8BdySgkUrz+ImePLd8GK2307eKhtTldZXDE4lLg
X-Gm-Gg: ASbGncuRpRUqxMMKc4Ls9i4NahBSOlXjKry+7Y7WOv/h9UH6gcmSqt8cz0yTzIVfVse
	mCHPR+Ad2B/39A/E7TYJ6c6q5LSKOia/dberABomnnRryR3Pe0PGwb4nL4dts1fHZor3O6g2pLc
	XAaL9Cybos3FxXIQ23fUhaXFHp8sYLk4q+8tm+tulqVYWZv4LIbcrZc5mJqq5KjmBM997UGc+nR
	kkBflQY7Nr8ILQ0ezdmYt3afDjQ5fWPwSGBa3hm7Zra1Hudt+DsLpvmhUUUptP6pGrzGq/wtByH
	luvdkQF5Z23jgqxX2kd02ZODdLz5wybL/NTEsz6/CaauuRCo
X-Received: by 2002:a17:903:250:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-22c535acd5cmr10394295ad.29.1744930659341;
        Thu, 17 Apr 2025 15:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBAuEjwHaEZXENzYVQE1lvTT1NCzReKwLeY+hjH58qSnO3+/ge+Ko9QKnGemzx9qGvP8N7/A==
X-Received: by 2002:a17:903:250:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-22c535acd5cmr10393975ad.29.1744930658831;
        Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
In-Reply-To: <20250415184102.2707300-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250415184102.2707300-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the QoS control field
 offset to build QoS header
Message-Id: <174493065820.1347382.15327906368454984938.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:38 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 5o644X74RaUOT6RGG7-_iol-ttsYJRnK
X-Proofpoint-GUID: 5o644X74RaUOT6RGG7-_iol-ttsYJRnK
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68018764 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Z1h1_94KO-iqibAjzYcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=508 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155740_806232_111C93B1 
X-CRM114-Status: GOOD (  10.34  )
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


On Wed, 16 Apr 2025 00:11:02 +0530, Nithyanantham Paramasivam wrote:
> Currently, in the mac80211 layer, received EAPOL packets are dropped
> when the HT control field is present in the QoS header. This issue
> arises due to an incorrect QoS control field offset used to build
> the QoS header in the MSDU data, leading to a corrupted header in the
> mac80211 layer. This issue also applies to other frames that contain
> the QoS control field, such as QoS data or Null frames. To resolve
> this, use ieee80211_get_qos_ctl() to obtain the correct QoS control
> offset from the MSDU data. Additionally, ensure the QoS control header
> is copied in little-endian format within the MSDU data.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix the QoS control field offset to build QoS header
      commit: 8599d4cc4191c8c1af34207a8b9414acca4afb59

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


