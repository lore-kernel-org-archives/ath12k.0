Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67155606D815
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=464yJVTR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKXpZ0uB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Svhf/lr3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=; b=464yJVTRHqXx+x2E8WoOhAmC4b
	KD5WAi2snkQaGHX3eBVFfLH4XleQg1xNf6vPA9cK7mRqs/0I88vvlRMp9rbJI2Wn2kZ/Vwx/FBpPv
	WqmZq4eWJAxka8D+xdfzzFExIr9fg5pIKQagovnDpEDyPkO7tFXkdPlsyx7Ce4HN/H5yRFeOIFBTw
	AwEp2ZYICRQZoXtzO5N+K1OsRlbuWkFMBwvWkzGNWK66hA1Glq36JHbx/64+JtSy8QSRBfAq07ak3
	j1tDZ2zzs3LLCHPYqEEaD49cg2dGxFT9StimjGGlHlyeiUzG+kcmzbVs8o9p0GrPYWFBzFs9IOmjW
	jwERIPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC20-0000000BEkW-1tr4;
	Fri, 06 Nov 2026 04:58:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC1x-0000000BEjy-2Cau
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 04:58:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xs5w1866651
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 04:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XsgzVUmQJNtfxzke+KkwGJ
	hVOf8KyHdxG/9A7ILLhkk=; b=BKXpZ0uBffnIXUd44jYNYymX8NvOygEOzTW1H+
	LO3hKZ3Ume2i74ijhKRAVOpCdH+if4ulzGcdwV3oWKFEmnKJBlHutPiIvx0t7hu7
	hQ09C2fPzCPG3AVEUhSFl1Zjngecfe2j9tjDCUDyZKSUESrVplx1lDywryYXbZDs
	q50wxuXhHGIqdjoSHUyz/5E+Y70FRUkX3DaPzBbqqogcrLFZs/kuYVTIurVr/QYP
	w+iyAa8nsyXsH+PKhTT5TPyBvCZexsa659FyR4+hRxs9IfQwHamLdP+cU5c4H/YC
	qLR6QyUZAAoqmfzy1bMDo4MbamZmRwbtrg8YOvEKD6DQEgZQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p98ybv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 04:58:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so499043eec.0
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 20:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941104; x=1794545904; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=;
        b=Svhf/lr3oCiyLcxBj20WL23xWB2lvZX5aChIKZvRVUNQneQV0mbBRU/dDFrJJ1w3eC
         7yqxmTGDIJoSoA/Juu4kqMQPB0D3ajs20wK7fpoM1gKkou/egRfH5k1sFkHTmci6WnUi
         iloFg9VllpBz9Qf2MJWE3ghcsYMQPg7mZxsGMuPZIkFFZt50tOTk7DxjrnBPKK9UMi7W
         8+JhHAhfwFheGvdXLGxGimN6uwfNQu4eI0Oshqbvkx4qZwbjPk0uHxQtry2QfmMH7zud
         vgWY5zuUTrpBrjvpk2A/nt/SLzbuL0TohcyF/vm1j72RAkvnckGNYIHhiffBdJTthsJa
         Fw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941104; x=1794545904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=;
        b=23jHeP0rxLyo6GnfjrQ+8KUqM+Tgf4m09buWmGeOeSCfg8acZU0rx5f4+MJnOm0ffa
         kXenqXLf0P1V0BbUzsM6KI7EhYlY0/MARFkTBDQUeKMWE93bnPFy6e1Eq+MYHvakJdfN
         OogUt0GVCOC7jVaKVd8eeSPgwykek4RKQ2S1jjXgGF5Rov1i1v1WTnEy2sdvCKyI1ZnJ
         JUVKzXG6Dp2P3yLrZry1nZhsSCDE5ScDv8XdYcHnPng1Jfz43+3CJ8KrF193P4HsH14B
         fu+UVYquZKRe93qtWUgi0AZf7FeLwMo1XIzsHq/j84sBHC87Eqm1Urng2oOO132mfK+4
         +hXA==
X-Forwarded-Encrypted: i=1; AL+hErH216kngOsby0F5MXR7xwZ/4zFDOBuYtRcpPpF7wyuxxyzEN1mdA3AL6w43mJEuPOJXaeih19c=@lists.infradead.org
X-Gm-Message-State: APuU4Z8absTPKMWTkJs0r6G2CTC7EXa4grr8/6MtyDGacTCXN5u0GtNr
	NG4Tsy7PUpkefJ6cisixxZcpYyUweVQ2mmNOu9YLw0D51PM9IXjAColvzouJk0QprMYo0OC4een
	Oth0OMgTf2HbX3RP0VgOkWFgdIoxTHHDqaAC2BXQE2SvvBvlqS29hYKuacCfveXd6
X-Gm-Gg: AYBFou1Sl/9YtjtU5cexWXtcBMeRRTU+5+kzb/aCPyTMQTMzQ2PSCty6XTHTO3qaVo1
	i4L3bQ0relM9+1glOzVl8B2W9Wp8HoMSJ+RiUyAmf8YGWHFxhVyhS9ST+RiAGsM9wucMQ5lTVoH
	KPaV4Z0Ai+grNIbfXfyo1WMCjswYZ0hKLrZ+/vbLjt5sovm99dFlPoO0m1+kGYaD8n8TomGvZZE
	Apz8xxUgrnHSHl9dDQSqxwwOKLDHJwxYBJiNJ6DBZbKEpERqLo0yVDbo4ZD76JWj8Vz7JcRx4Xd
	t4LrgEHEbEyIjxEpYU8x0+8mXpOFFP6t4kcHrOgtga3IciylMgOcuVM3orWe8X7lzWammTjiWcv
	djidG/eIz1NPjS5gecDRWOe1+nquAB3oxUpJR5rujPldzHdPWLwaQlBzvg2V6Hb7PTMsHKDow38
	NLo5v/XzCTOdqA3B7Gs5eqyuuOsJhTlT/mNmqU7bWIrBsLCg8F64tdJQQhroh9Ur5OMrXRE2noS
	Rzo
X-Received: by 2002:a05:7300:d112:b0:36f:6b99:f963 with SMTP id 5a478bee46e88-36f76023b1bmr1859386eec.21.1793941103847;
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
X-Received: by 2002:a05:7300:d112:b0:36f:6b99:f963 with SMTP id 5a478bee46e88-36f76023b1bmr1859359eec.21.1793941103304;
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
Date: Fri, 06 Nov 2026 10:27:41 +0530
Message-Id: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVe7WoC/x3MQQqAIBBA0avErBtwhKK6SrSwnHI2GioVhHdPW
 r7F/y8kjsIJpuaFyJckCb6C2gY2Z/zBKLYatNI9keqRXcbV4C3ehhu7TdudzMAjKajNGXmX5//
 NYLJDz0+GpZQPxE/huGkAAAA=
X-Change-ID: 20261106-eht-ba-window-5c2df1a8e910
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Paulson Raja L <lraja@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=1181;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=rbcT2clgcen0buC6OtLy+ozWF59CI4Wkol1yGU9nElU=;
 b=gcqBGq476ntp/TuFBnNIyxk7qA7phEhnZv73IWeGFuOdIj96tGa0ZjaX++u8C725SdCkgLb9M
 OK93rJSLTTODWc1INGvjkNfy/0+dtmWLIq+zjyMQ0xDUJxs9m1jeTgS
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-ORIG-GUID: hatJ-dmV7TEZYFd9ZO3RzdBvsBOKZIOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX7JdYNjtwD+Uy
 lnnkG/0eOipd5TnYN7gLPuInEBc+AVh2fwtJLzjhYd9+cI+6YIHttjTrlZ7vkVHm5Raw8yhQBxI
 l3MaRVWbRLSIlz2K/AetGQRDKxhqNNMQzxA7nLdROrfjguYxj6WRFCOiZKog5IxL4f+PuzSws5Z
 /xT3ON2hi7djaq/BiEmsCFzGCCY8pMte0tqZoysBgCPYEI3Nrd2NzKVOvgU6S3LKg/6JVrEdZ97
 JjWK0QSnzaZggG4eLoBUm7uynTb6VOQcLujC8NkltCp7m+pzhTWqwPYX0DN/LkJghmpBNyXQa65
 DlO+mQQ8byHaIA7d0n2gF9BxSrCWNtNRLlX5MvYMfEZ06Mz6dT9ROJkk94fHkm21jYAoGl8EBjr
 dDv4dgesw8SYEFgbRLuob0hHD9k/wQYDuyugxQGTjWKGSbhwnaWVOi7kSQ+MM/tf7zWicAlfM1X
 XLOTdiq3ms0EtWsiKbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfXzSfewyRWlkWM
 qCq+OYLPORUbaJRifXWAsoeb6fECcbc7NZEVK7DAmP463B+ZjEYvlrWBiSIq119kt6TOZMXtL5d
 FWq9dYFT8/0AgWKLBOTfgg5asthIW4o=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed5e70 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2SF_I0XtRLf-0q3h2KYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: hatJ-dmV7TEZYFd9ZO3RzdBvsBOKZIOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_205825_574516_41450FD4 
X-CRM114-Status: GOOD (  11.00  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses two related issues with Block Acknowledgement (BA)
configuration for HE and EHT capable links.

Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
for HE in AP mode. The existing code placed the BA mode configuration
inside the he_oper.params check, but mac80211 does not populate
he_oper.params for AP mode, so HE AP links never had BA mode set.

Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
capable links. IEEE 802.11be extends the maximum BA buffer size from 256
(HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
to 256.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
Paulson Raja L (1):
      wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links

Rameshkumar Sundaram (1):
      wifi: ath12k: Fix HE BA mode configuration for AP mode

 drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 25 insertions(+), 17 deletions(-)
---
base-commit: b9acb873d035fccc8824164246535ea6fc95c71a
change-id: 20261106-eht-ba-window-5c2df1a8e910


