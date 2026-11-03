Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCD606D81F
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vo7Ng1Uo;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m0j9ktfG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0C7lB/E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=; b=vo7Ng1UoHTc3+C/FOOSieovPdH
	O0gdz0KJNTkUtKqEiflbF1Lk+ILI9packmjWb2VQTi02kjjAzkSxD8OLdbMxqMrq9jLADeT1TYRzc
	P3dqtjLg3YMBrJgpCjxL5bVpnESpA3o9y2woeUeexgKrvWgIvtLL/cxaiPJmQMfAttD8DQhECulge
	ITFu8uCMXtHN5CE/vdGhP/AHeG0KJF2bsH+/oPnGJyfqGjWDi+ugBKFlJIexYL8zRQcw0+83D3ibd
	L9/mJZSRRUzyhcO0V2ml9VFJJ312Wl0bMobrvI4fIqJpEKrJEg+H8UImMxEkWo2BjQz2K1iM/38/P
	FTl7T02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIGw-00000003IoH-0pSi;
	Tue, 03 Nov 2026 17:26:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIGt-00000003InM-1yg8
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 17:26:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPbCh4123014
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 17:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qwa/XM4zZaFwBwMlrXOoTL
	w077/bwjKnjbAnCI5aKj8=; b=m0j9ktfGMfOtof9Tvwlao/5KfySXAHgqIqti7g
	VTg3YX3cbbBjmTbx4l3p1Mbef7LFOPaNyTQT1tYn++WU6F7l2RZGO0TWfY8rLF0M
	v8E3JvALZ+4+AJJL+zfqA6GR5LvS2aaINs/xnJQxF27kKiS8gHBnv6qmFlgZ8gal
	K1+F7WPi4ndocq9VZOxLkkrI7r7S1Fv/UFZvcDIwET7BhlMPVDphfaBHC7punqow
	NHY0BKWrTw5dLa8TWC6LqLRu3sqsFbfJFZkX0e9jnVc8QzK2C6RHswGU5SdZew4O
	faMJ3Vh4Nob36Q561ujujPSfVwgy+lrEktdxXLDUOjQYoNzw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9bgjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:26:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so8557981eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793726764; x=1794331564; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=;
        b=e0C7lB/EJbxNujIki/5UJTSAW/Dt7MhMQu7lSO0523Dq5jhqqueF1jvDYCbueEZcki
         8dunSWVv/xOe37iVmb1Vferp0CfGKi49wxq2U3HG2IP8s4o+Z+92T2nqp1HSJ0OSZLqd
         XoB2BJ33q7GSIWQxfBP8VFqvjdQw3laOEgTiNTLhYSKVdnHDuLC6dHPIXOjk2GbN79JN
         02/2Asp0wfekEFlaYu5smLZdW3ygkVXu9Mz6WxRdVMWpEbJzvik4ihEWa+6NGMzVrDSz
         L8Fhdn6/POpMXPe/CljtIaX7KP/sHNGVemoRC5T4tbq4paXozNbByKlcaeh16TKzixb6
         rPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726764; x=1794331564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=;
        b=gKGgQSFR7uMKNlF7Y3E62LeX94FSwL7iPWtYGQizS33ziNTooHzwy1Ylf2luh051Oy
         m3eQaK3RgVnZddS9sehDEX3jPweHLm0y7HdxO9GJL6PCzYhjRLHX9xDuaowa1n64eJhb
         tqvS3WNBBEoLX6u6sqk4vB5LZn1Ffd+TMCRdu9UkLvg/PUIs8NV6up9ImKpAXO1nhrGQ
         663wCXHfAcPkuY8cewjF4s4yrtI9WGpSE+DmBgTb4ZE3Q8t2IJJuqe0M8HGbey5yagZx
         JU3NJPyHeS5Hsq2EPNSmCUNOwf7gEfOo3kwd2U0ZHazwc8c+XwlXJZL/Yf9qmH5bmJC9
         X3cg==
X-Forwarded-Encrypted: i=1; AKwUvByPwB+lPGKu4OH3UYxDO23NelyEFTHBcI4vpeuXYMLqQUhyyN4iHzi4yeOmaVxcI9Fa8bTVewM=@lists.infradead.org
X-Gm-Message-State: APuU4Z94PbZ8ds9MiCvwEftxKzbzuzFTUSkSk8vWe4LS5cnUCb7Cm+/M
	fHXsP5+O2fTr34RhzWljasDEPqSXs0BxeHVN0fkx5G1TTNazT1DGpPixZhujJ8YA/rYrKex3EKs
	TYjjBJ4T6cp0TdFSuF1HgY6bw0XYY4QVn7S40uO/+G7EB1eoek852+Qyu+25QQZh7
X-Gm-Gg: AYBFou0NLjg0E2nzOyOFo+deRNnmhSzMT1P9i26YPdxzV3BqB1S4oB0erzr0ywFKUSK
	IenvcGPElQjmb5tf0iMwKVHtawKXTn28wTEH7c9AYCW5MR0PB34L/PEaXIM//Ra35k9jhGIrbTT
	OR0eHC7gplJN+Jv/HdQAwlUdKRPxTdOUuxPb5mUfXPvS4tkvDp2C0O7U5gHK3HIw9OAtgqg9QcS
	13xfnhy0EH80Z0aTshxZUM51zpJyguu4N/ugci4k/gz2DmMsredqSDb6Yw0+OB29jf1WdD20gVZ
	VyBPRlYQCIPNo06lCcnSKsM3ZigkxcCKCOBJNo2Pb7SvSswThRwzfHybEpEPAwh0IYrMvjOcxFU
	wqjRIrl3O4uuWnWEZsmBwChprkUYRDQ0bwCm7rH0GnZpZdAtg5uEfWoVFE1YIoOjsWMlNbldmOk
	Z/p/bEXLO/0Xxdb/cx0Qc6BiI7HyJQ0n4k1X4FjewJT+RVfAujBuvJrNCEMuzXodQgAYSXWvvOI
	mE=
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25556498c88.27.1793726764161;
        Tue, 03 Nov 2026 09:26:04 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25556431c88.27.1793726763302;
        Tue, 03 Nov 2026 09:26:03 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm357310c88.8.2026.11.03.09.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:26:03 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
Date: Tue, 03 Nov 2026 22:55:59 +0530
Message-Id: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcZ6moC/yWMWwqDMBAAryL73YBrsIZepZQQk62uYCx5lIB49
 8b6OQwzO0QKTBEezQ6Bvhx58xXw1oCdjZ9IsKsMXdvdEVspVqmNd9rkorPdHAkl5TAqhdj3Fmr
 2CfTm8l8+waRZeCoJXpeJeVzIpvMIx/EDdWPSH34AAAA=
X-Change-ID: 20261103-m3_and_aux_ucode-8337b881155c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: c66Isl3Exio1hoC3v4nCoR0iYhd724lR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX5f18CleekB0h
 Pc/HHnOB5kWr4o35muTkw44aY8hNQr/TdiWHuyVhdKNdDVILZFZTY1L/y+4Rqrbz0Rz6W2Hj7Qi
 /CuLJUkE0XsBoDi1msiChZ0MVjaKSZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX2gu2hRA50eyE
 VNzP3IWKstr0qMK/poLJRhqcw5UtfBm6B/BBNhPk2YvUXYALosYa7Dfeh5zVNdUStYQ3R2+R73v
 sIWysc+IgGGTN6+FemTbkaCD6onQnp5M+wyml1nyq6IF2O+QrrKwieAkxLwcdFz9Q5IZzXjFxZq
 y/E72LHT2HlVqUq93uOnX10irdLCdsB+IxghEWaGH+wJpBKJEyoCR3yYKANfObeUqT3IjY820cd
 Hl3st/riXNEWXu1LKyQ5pYLyUScBDw9yg3Mio9MZWwJ/EXapUWtNlVyhxHIIRE/UeNPCGWTgqvi
 KB+hJbXc8Af3kHw+HfytjHOowJH+1wRl2uUdQexZi09pgyWagVusA8BoOrn8F8myMmsbZgqUBmO
 pvnI4BiJ9npPdCR0NR6S1ui1ntOjD/5GaZ+8Mw3VbsgEb9WA+9fXIyn6nr0U6ET16X6LMXcfNWL
 hjsKTAoQAATnlNd2yiA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6aea192d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=xzHXWKMcZAd5FHHA1I4A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: c66Isl3Exio1hoC3v4nCoR0iYhd724lR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_092607_629745_3B00D02B 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
logic for freeing a DMA-coherent firmware memory region and loading
firmware into it. Factor the shared logic into common helpers.

Patch 1 is a preparatory, no-functional-change rename of
struct m3_mem_region to struct ath12k_fw_mem_region, since the type
is also used for the aux_uc region and the old name no longer
reflects its purpose.

Patch 2 refactors the shared free/load logic into
ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
rewires the m3 and aux_uc wrappers to use them.

---
Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling
 
 drivers/net/wireless/ath/ath12k/qmi.c | 163 +++++++++++-----------------------
 drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
 2 files changed, 57 insertions(+), 112 deletions(-)
---
base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
change-id: 20261103-m3_and_aux_ucode-8337b881155c


