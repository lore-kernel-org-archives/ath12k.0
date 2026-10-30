Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE92606A326
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 22:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmGd7tWh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUUuXPGa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=; b=LmGd7tWhn0yAOj
	YR1cMfkqumfFcmKrDXJIOkT4fraMuQN7rm5oAWDs3epJ1ffitsiLS0x5jV5/5y2Gt3Rvl0huW8x4X
	K9nWOzOy51AE4JUtKeQIzyEjuzB6FAtwglec54sBoXbD79JSeJWi5D8GqQRZWIA5ZHxLvSA8xTxm9
	kf/6Al/FhrQviqSeKyYQt2VwEAlWWuBxvNjYrPmF7ZBdEpBS0nJpj5J9vTo35O/MZQxdT8gaHTNFR
	A0Nv0zsetraBngVHL72X9wHNTsvvo1w+i5BThnxLX1vNl96Zyl+yNq60+boQsek6dGXoajdsrFZbA
	CjkOftd6AZkiTrfrDiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMumA-0000000Cf49-2fXm;
	Fri, 30 Oct 2026 22:08:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMum8-0000000Cf30-23xA
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 22:08:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8092405e9.3
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398118; x=1794002918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=;
        b=EUUuXPGa868SP6Hb2Vio28TN6z9Bn6Gv4J3bMbTbDJORtljvHJMt57Z/9tpKJczffC
         LXBSQFXpQD9CcPGHHyFcB24LO1ImkUBHsjU/Jr2Vb3jNGDvmykROvMhWMx8vE+ip53cJ
         GaOWEGEnCphtWwQx3wOX68rFGAuDL5YC0P6ZxPDvx1+AgZvZrdLDwacK35og0UlXJ+Bk
         6rJQZwbXgwAbJjC8wt/eE3nYMOy5MaMto5VjNWJE+yZdIAAqFNLU1FtKAHfxcKP56F7B
         yoII1tBbnU9uI2LgGLmteeui7IE6iX2IE38zyWtU0TTvk9LjAwkc7tPw3fve6mE3DuJ7
         H1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398118; x=1794002918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=;
        b=SOio3eMslRqZR7iw4IFgsCz906sL581faJECaM/gpCKR23Dk/CTeORKkQoZwow/88X
         RIlEIYTixtIEn5Q+VAdTCNqgt6s/WA3s7lsOmwQfJ3uCvTAtZWv2OeGqIBW1o1ioXCp7
         a3HXQ0gCko3AdZ+w0iQkzIkamnkRcVavYeTDDc7uAvbCaDjuIydgmyP1zz7JCMRq/+Ph
         8js5whfj+xDcNetexYmd6imZbpznDQ/GAhq74ZrsUk5TFoMfeph7NXPyQF0FHe6ITfrI
         zR5kLIuBaNDEHoW+GGtO+9c4cnZ+Im5F5HolzzzMDUhe8tRJu91IiqhFVa67X03O1SDE
         +FQg==
X-Forwarded-Encrypted: i=1; AKwUvBzYbl1o4r0lhDbXbmxMdFjkto7//+mQyf2WJlDSX1nlQmnLy/gAJzfB+cHaWQ7H+p+eSRHiHfg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIpEYd7rOJkUoaC5Ap2CL9zOhB6QNOTEzBBhQZcmUwf9xgfRIc1
	6sQ5pCONPCWW55Qsc60g6sb+V9E7s+q4Tq+GTJc4YWALsVtUEfkWAGuK
X-Gm-Gg: AYBFou3V2H2A71e0JtsiwILNlcdzLMMjZfDozEouK+YZ8W5poFTrtNcl3rY2/5h24vc
	dhiThaRmNuzjMkn5z+N95J2K8BfS++isIHaLHJYlVW2RynmK6G/tRNuXA+dIay8PKPFO9BzI1ib
	PomLeZtnKO5bC83dPt8JN3N/Ukvlu1zwnAWFT9pFc7PgS34EgseQO7y5ZGpFBy2VOAlExj5dsBi
	ZvW8jzuhrT5IH5mBrT8JGI4cy2QSz9111Q+jbfpvCbSFY3h/ONUAb+rFvRJaOSoDOK8Fnr0mpKm
	dMdbWjkercxwK1LW39hWxSSOkinugPbdAK2SLScNY3cO078AsX8fLG/Vd7BxrEqxNYmrHlRcGxg
	2KuNYZ+cY/TUh4W79fVzyqXWYkkgLAu8DFhj4g0SLu0EDjP/eDQR4vYbbQ71XOxgVx1gNDdLVRN
	hiCxAAfcJ4ix2RoIjckE5R40/20kdimz3PREOMqPe/OJpU5zoIF+23yYcuLTkQNXCPL8uQNsC9v
	id4UxFtEiSxMdH/UEr31t24QswbnCqbmCm8qf3/y/G0C2p6jwJ34AT9TfZDPd8d/npW0/pnpw9v
	s6yQCFClA28WvkCD4GoWNFgYf0n83dUhWH4WJvBfmrncUenyUFjtub/yqD9TFq+S+m5NzTcWPYI
	kENgLWEmu52AnklmC95+znHjfbqKP0b4IdcT5PJhWiDGIFNPKLu/DfjLccQ==
X-Received: by 2002:a05:600c:630d:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4ac150b38abmr79417375e9.3.1793398118067;
        Fri, 30 Oct 2026 15:08:38 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:37 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 1/3] wifi: ath12k: allocate the AFC memory region requested by firmware
Date: Fri, 30 Oct 2026 23:08:22 +0100
Message-ID: <20261030220824.915760-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150840_567296_11CC18EC 
X-CRM114-Status: GOOD (  17.49  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9274 firmware WLAN.WBE.1.6-01243 requests a target memory segment of
type 0xa at every boot. The driver does not know this type, so it logs

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported

and answers the request with a NULL address but the requested size.

Type 0xa is the AFC region: QMI_WLFW_AFC_MEM_V01 = 10 in Qualcomm's
wlan_firmware_service_v01.h. The firmware asks for 8 KiB, one 4 KiB
slot per radio, where the host places the answer of an Automated
Frequency Coordination server for 6 GHz Standard Power operation.

The firmware's handler of the memory response records the reported
address and marks the region as provided whenever the size is
non-zero; it does not check for a zero address. With the current
NULL answer the firmware therefore holds a region at bus address 0.
This driver never enables AFC and no misbehaviour has been observed,
but the firmware state is wrong.

Name the type and allocate it like the other host regions, bounded to
two 4 KiB slots. This removes the warning and gives the firmware a
valid region. An oversized request keeps today's behaviour with a
warning.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c |   17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |    3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 280e50a1f31d..0679e5d2d4fc 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2707,6 +2707,23 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			if (ret)
 				goto err;
 			break;
+		case AFC_REGION_TYPE:
+			/* Firmware requests the AFC region at every boot, even
+			 * when the 6 GHz radio does not use Standard Power. It
+			 * treats a non-zero size as a provided region, so hand
+			 * it real memory instead of a NULL address.
+			 */
+			if (chunk->size > ATH12K_QMI_AFC_MEM_SIZE) {
+				ath12k_warn(ab, "AFC memory request of %u B exceeds %u B, not allocated\n",
+					    chunk->size, ATH12K_QMI_AFC_MEM_SIZE);
+				chunk->paddr = 0;
+				chunk->v.addr = NULL;
+				break;
+			}
+			ret = ath12k_qmi_alloc_chunk(ab, chunk);
+			if (ret)
+				goto err;
+			break;
 		case MLO_GLOBAL_MEM_REGION_TYPE:
 			mlo_size += chunk->size;
 			if (ag->mlo_mem.mlo_mem_size &&
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 6da10f3cb597..c438ef6c7680 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -26,6 +26,8 @@
 #define ATH12K_QMI_BDF_EXT_STR_LENGTH		0x20
 #define ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01 4
 #define ATH12K_QMI_DEVMEM_CMEM_INDEX	0
+/* AFC region: one 4 KiB slot per radio, at most two radios */
+#define ATH12K_QMI_AFC_MEM_SIZE		(2 * 0x1000)
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
@@ -173,6 +175,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	AFC_REGION_TYPE = 0xa,
 	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
--
2.47.0

