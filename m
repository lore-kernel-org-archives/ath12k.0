Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E10C54F5C
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DCcX7xf/ngzQRU5CloFpJDSQhr7BK0s74VSAzlm3R1s=; b=j2OfDdiOOjxCtW
	PDlLDdhnHbfl5BWaFoSFxLXPOdQpMH3UeddwqwaerMKn0KBhHOyMl8UE6UFy6aigKnlKa3/30NOjx
	Q6GB4fdF/RWDdkVWZZIWIzaspJYyWDapkRiSbjleMJlx8ddOX09tRNI3iKb8Uc/y8yrH49ChLmROE
	iQwpLkMlvTWtrRXrIftmlEG4O4Y7DLfDwFX0AHungo62VYZ3mKm5Zd9NXHFqYJZsDo3XGcTdy+RTI
	SZG4hMFcWPvRBdKWMpL87ZDRB7/ftVWEZ5oA47VkIAGFPXqcYfJ4AjdLkNs/gQRkfIbyndeoDww5d
	0Lj2f9YAOVCJ9Hr9v8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYt-0000000769X-2ixS;
	Wed, 29 Jul 2026 07:18:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYo-0000000767k-1g4E
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 07:18:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5bER0882495
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCcX7xf/ngzQRU5CloFpJD
	SQhr7BK0s74VSAzlm3R1s=; b=Re3uUjMETPPg0EZzo++HIqpFzmAbWUKt+Db9FB
	C9prygbN5s9Ws0/atrf83AuUDnQXn24/Z/zW7JD4y/W2YhIIDas2xqe/LXtV6Ypz
	G8L8NJvjqOcHG0CFFIkVIxrkaKP0b2i+MJluWJ9bHVV+Z4XeI5yFj5wOOOw8vyP+
	81tcwSM9lkyhJRuoM/9YOX3P/9554gcBRUFbRh3OsANTcCkrUTsGtrzXpj4cqVsr
	+gcbbGJe7Ea1AjAPqPw398IdOllhpWIDa18oV5IzWWyu3ew/wwVLhTMYlKSLbLzN
	bO51bjnrM0h2s29VnZd4FsPj2eoei+Tk8JDlSEg2ZWRInOWQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbhj8ccd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso685883a12.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 00:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309514; x=1785914314; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCcX7xf/ngzQRU5CloFpJDSQhr7BK0s74VSAzlm3R1s=;
        b=KdJjIaM0p0kAujRf2hBt2OjyACjLnidhKC0pGv4d/xB50jzVUi313YBXD86TNZ0fX2
         dwUmBEPTd6SGz6RwkSeavf9TmQ7GsY7An3eDlv96iIz3R5WXfYvVDtWqHtlLtEM3NYTo
         0shraPLfS03E8B5iuBA0POCewT71yYfnUyuc9UptlCr6sDMVk+QPKRisW53+adnVLkCk
         r0fu6ncqPdAjelWuggZN21FjXnnQLQM4YQogbjHmc0ylxLfTaqZKVj4CXl1wDMLr3b/a
         nz9GkabJKrA3RXD524kDz1TlVUd5oUfAmraxMKP9c073QHzHh+5FNzQUtZcv0eaiSRu8
         AyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309514; x=1785914314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCcX7xf/ngzQRU5CloFpJDSQhr7BK0s74VSAzlm3R1s=;
        b=RkuAFLbqdB/Za7mk5ADbE9OljQKAPp9LaIyeoJfbUVbNcqjm91USs6AISebadFffvH
         kApvWxMlEcfeC0YxqlIu6ElIA8DMRlL/iFAhga4anky7QeZ3CuWFdYSsWYNorw7HZGpn
         SNKMtr2udvqV/G/MrvK/3xx21dyKlYBBgV3LQtEKd1HgfRIQMZZYuKWtwnSprAyxUs5q
         NFESBjDylxS2mpZslUdVGrtEOppZgHFECCMvN6FpLO4IeO4NyrSYKjUIHF1JAWCRatYc
         PWmqQ1Q0/jk4c0FvVSo4yYwEnkHjx5dBRd99Wz6+h0WnD2klJZZ5c+5CKmuf8DYnGPAB
         JqWg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Zyr+N4kAfAQevumLa133ENPU3N/qiJG/DPYEGK2UOyQjlZ+coj9cZXpRfYwYMBnPVIxk9bg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRtfnpOi0moXHpCpx0z7vq6ZCL+VAtC/wlqBLjQyKwZDjRpVel
	KZvYcfmfUA34sIDa7k21dKttiRldPW/UlUpPibINVpGktvLdQeb6XLXI47ALiU3WqS2i/53rFk2
	qwcD9V0JmFF+ZQrMoyozm9pzCz6f7Tox85q1sEd5WoYTwBiELK0+TMrK2R1NgviE5j89kLxSc
X-Gm-Gg: AR+sD13Ei40uW0yj5SeoHK2z1wR669CdH/BcizKZGIhOt6f1AIliaOg3/wvd0fPN7Us
	hwqjJhDZpLVPVB5EXJljkIiz/Nzs4ldUI5mk6ZdEr4TqsK/F8CR3rjZUqKG90vQ6WXeLTS8x37Q
	cM3BBSCT36d9DqODnJluYOmcBEx7G3cWPf4jjEFARAlFoYrj3yiDr8RXco2Deg3tS0TDRVFLnCd
	2NvgyBzky6eEjK2PFKWDqGLUUEGSkhw7B0DRAGz/NEedUvvx3IZgcNBTXVHpYzcst0yP8iuM5eb
	Mz3Ok0zvw7i4YSjLb0E5BNcgfzM4IA4OGpaI5IrmyU8ztsJL6DXp9qmvpETFCQVPmQUMTFcEmqo
	GpnD6rFh2m2ZW4lDjtQXBAfdSLjWGFS83GmH+KBaFxEYoCm359glbIw==
X-Received: by 2002:a05:6a00:23cb:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-84e93192425mr5512096b3a.13.1785309514179;
        Wed, 29 Jul 2026 00:18:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cb:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-84e93192425mr5512080b3a.13.1785309513744;
        Wed, 29 Jul 2026 00:18:33 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm474793a12.1.2026.07.29.00.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:18:33 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/4] wifi: ath12k: fix timeout while waiting for
 regulatory update on bring-up
Date: Wed, 29 Jul 2026 15:18:10 +0800
Message-Id: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOpaWoC/4XNTQ6CMBAF4KuQrh3SH2jRlfcwLkoZoVGotgUxh
 LvbsHJhdDPJy8v7ZiEBvcVADtlCPE42WDekwHYZMZ0eWgTbpEw45ZIqzkDHjvEreGwbeGobIdo
 e3RhBFlQU+0qjoDVJ87vHi503+kTSCgacIzmnprMhOv/afk5s6//zEwMKpqwla1TFpCmPLoT8M
 eqbcX2fp7PZE//0qh8eT15NhRBsXxql8Iu3rusbioq5wCEBAAA=
X-Change-ID: 20260721-ath12k-regd-wait-timeout-6403498ae30b
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX/QuYoABjKxLg
 /B+aBcXe7f6GmT0JBmc9QhElrz2CmuDJ/l3Tawi8xuWLOq646N892kIxMOQ/wcH48dmJOrK5YgU
 U3wrOLWqXDSyCnU1xKrsWaevtxuvDq3MpsPSsFNkeCt7VVHPdRQfe39uPUGHJvM7UhMK6eqTYrA
 kQFg/4PkF2WQPO2c/14InD6WM8ojFPkPH4JqtdG/5B6GAoAQqbMa0NW1E8wmT5fJlRLIR7T5R6O
 Y8/w9KQnU4hj5W+bzTd2M8cu0z9bX+2/UgxNrB5MU065GxTojkPKvOW89LUsImLr1b2wkzTTTGY
 Xu6Odib3QutzDY7aE7JeKzcsue8896Tdum2VW93hySkqxlnB9zTHMZildXglY5eZX+cBui0lCNA
 Yo6kR42vAlyuOr+XvZpa4lfkkCHvu3Uwm/E7L9+jypj8u1/yXn0rBJssHaRDSbAFzXoNlfn0Ejs
 9IbOueR9ApnmwtixNKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX1qtGo1lrtqiY
 BUwGZguagyxzk3ePjDSptmikts9PnnV09o6NecBCVrhoP3zybCN9tDr/Va6I17yVdhM+pvN68Lz
 LvyMSO3Yw2md56hd8E8Ag1ITqcsJUyg=
X-Proofpoint-ORIG-GUID: _PD8fWXeSDCxDfbnMQdEU4DbkMqeAkLP
X-Proofpoint-GUID: _PD8fWXeSDCxDfbnMQdEU4DbkMqeAkLP
X-Authority-Analysis: v=2.4 cv=dsvrzVg4 c=1 sm=1 tr=0 ts=6a69a94b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mipiRFW3E6dyOBJFvI0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_001838_563848_657AA317 
X-CRM114-Status: GOOD (  11.52  )
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

On devices that support setting the current country code, the following
warning is seen during driver bring-up:

  Timeout while waiting for regulatory update

This happens when the country to be set during registration is the same as
the one already applied at boot time: the regulatory event from firmware
gets dropped without signalling the completion, so the waiter times out.

Fix it, and also skip setting the country code when it is unchanged.

---
Baochen Qiang (4):
      wifi: ath12k: signal regd update completion when reg event is dropped
      wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
      wifi: ath12k: protect new_alpha2 access with base_lock
      wifi: ath12k: skip setting country code during registration when unchanged

 drivers/net/wireless/ath/ath12k/mac.c | 31 ++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
 2 files changed, 35 insertions(+), 7 deletions(-)
---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260721-ath12k-regd-wait-timeout-6403498ae30b

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


