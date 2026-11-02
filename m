Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3FC606D818
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzlQZlAu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gap4KfL2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=; b=qzlQZlAuYjP51t
	FP5D86wsPCdO6DqM8HlEW+CMhlQgPYYzD5TpQpYFomNMCfQWaLdvHLs+fzxbOcsLc2aFb97G7MIvB
	RQ01GL9wOjnlGKTL9rBIb7sxmOI8lugz8D1sNcJMymJyw7eCLgbCP7OzUnGEdWa4lr/I49dJhaH7k
	qeesoUDVedN0Qo9rrNrjZRWgENd31muKyJv0HiFG9i/F+CskSXylvagcccTsgMibUjMk2uYWa/GxR
	cpLH1FUXD/M+aej2RWPd6dX4kL66k3aeR1lZAGE+EfeL4kv6Y9fRRTDMEmdi2NSMXYPqMt5XH0oZn
	a3eUUrKeftiXYeW0+Fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFs-00000000GPX-01hJ;
	Mon, 02 Nov 2026 20:03:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFp-00000000GOF-2X5v
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 20:03:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e4831c028so3010114f8f.0
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649820; x=1794254620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=;
        b=Gap4KfL2TRaJDufLmfda3bbaU20u7hHvWTTX16xfnz173phHUIDhmXJGF77M4MLyvh
         y6OL3IfcSTjbjbs3rGfhg017RvI78+RYUu8aKpgNNfTwjeln7JWnS8+1wxt4FBLo8jDV
         SI2OW+vujq99FKO+kos6WWmKMftaC2j0hlyQhGqgkTedeunLYuLOA1WD4gUxyhQFHKMI
         1RhxVbDDqFz/tBW18v4tYZMHEs0SDFhS5mB+dNYw8eBK8SWLER3Ftlp2ww82fJuvEH+o
         0nyzrJZnL6ctCVOd11voPxRi/hXNDDKCrXdw0bAUfP8sp1nzDJCU/c8/mIHgzjif0vIB
         UMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649820; x=1794254620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=;
        b=GvqZW5LjiLVhqTNKMrAVL5QHyA2usFs3o6dVRadg6clJecIXn4GAckHxwLBdjNyPxN
         wvW6pIpm0jBRxIqoa10QRAgtOHnYj0WQ0gS9hETXML8pfXc2I+9UwXCtIsPw8MfXO4CH
         wssJM3kwwyxzB7yXV9vAhLfw3BxYHmRTtdVMpHrLVuuuTxh96lS7cQpDX7EVs5Jh0bzD
         z4MUprf2vZyqqLPKVyP50aLn07Yo5QlkSolcjykV/YraX11Cpwg59WBWTeNwVLnIN18R
         mBfqOk7qiP7/b9SePz52p4Yy3g5Fcsiigv5AbEJEaiLHu3NE/HJADHcSc+BRWjVeW0Eg
         tUSA==
X-Forwarded-Encrypted: i=1; AKwUvBw0i6Tiv69gdWVydvJWNHz+lwwUemrXNpgViuQUaCEFCnFHz/+FGN5UdeOYSHm6Cfd8YS+G6xs=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+TqYHC+/lX+h26aMeGD97LIxNrIAj2tkUZoI7V0vi+ws+KoHw
	B8Kngi79VjcyNLX03kdJ2p8X9nTCFBNQzGAS7tdXbQaqsTfV03hZXWKl
X-Gm-Gg: AYBFou2rI1wJDLpNe4hP3ZeJFZb04uNQuTMzlWhYt7gFQRcNMaqCs74A5svX9XSlFuj
	pjfr/AxGhdZ6QFfj5Qtl1SCnPVozoWyK3zguYnMrstMIFG3aURZx8BOFPPXvQxRz4Uv/PwP24OI
	a0pYttHyMlv1R9hjgeU4zDgc342Hn+MZM+splWyQmRJ96bQMT0VJcNcZvsVE924A3t61cFfr8lP
	SNXV87/oABBFu90TeiPkvG9AdrJ3TlP3Ev2HV45lb1YOqOBrg4ecQQMt0jLHxdhWSSsoSETAClf
	IRIsBgnS2hBGp9O1x8zkJsmmJSXa7k0WQuC9rRSGsUIN1aYBgHFQhnFIucVBtjb24hkf568AzO0
	HgG7bmgm30olQIj8u9UB1HjoRHXiXceN6WdVwmOAiT9qN2L91cszU6nPLEd3CeU3BQYg1pjFl0U
	7FkE5RCymP/+CpLAgYMycDXY+wjh7p40Yd9JJt+EMKydSa5jhHlWZuBUrZ7VtNopRvsW63TX49H
	IJyS9BVXqcgtgYjsHthwtze+dzZtzf85NvdfO2ao1WTEwPDrtpIGmBPYQvjE46bTHaoaeHuFTMq
	OSXw+dzV+ptfdoYWTM+JufiXvfYPCV9xjXBMekoain9xa8OOxHPvdni3KA+GMLZdAlaNnBhhvSZ
	v7Fgq5QH0BZr6VHCy+SQx8NOcRnvKoSyiCt+Id+21Mn/kek9DH5QSL35YZawzaOWbgMZcd/6ccd
	HQCY6Q09hsTBw=
X-Received: by 2002:a05:6000:1786:b0:48e:6c09:cffa with SMTP id ffacd0b85a97d-48e6e50b221mr26395521f8f.48.1793649819769;
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region to firmware
Date: Mon,  2 Nov 2026 21:02:34 +0100
Message-ID: <20261102200235.48973-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102200235.48973-1-gsustek@gmail.com>
References: <20261102200235.48973-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_120341_656225_71A710BA 
X-CRM114-Status: GOOD (  15.68  )
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
wlan_firmware_service_v01.h. The firmware asks for 8 KiB, where the
host places the response of an Automated Frequency Coordination server
for 6 GHz Standard Power operation. ath12k does not support AFC.

The firmware treats a region as provided whenever its size is non-zero;
it does not check the address. With the current answer it therefore
takes bus address 0 as its AFC region and maps it for its own use.

Name the type and answer it with size 0, so that the firmware sees no
AFC region, and log this at debug level instead of warning. No memory
is allocated. With this answer the firmware sends the memory ready
indication, reaches firmware ready and brings up all radios.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v2: do not allocate the region; answer with size 0 and log at debug
    level. New subject. (Rameshkumar Sundaram)

 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..55952da4343b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2755,6 +2755,18 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			if (ret)
 				goto err;
 			break;
+		case AFC_REGION_TYPE:
+			/* The host does not support AFC. Firmware treats a
+			 * region with a non-zero size as provided, so report
+			 * size 0 instead of address 0 with the requested size.
+			 */
+			ath12k_dbg(ab, ATH12K_DBG_QMI,
+				   "qmi AFC memory region of %u B not provided\n",
+				   chunk->size);
+			chunk->paddr = 0;
+			chunk->v.addr = NULL;
+			chunk->size = 0;
+			break;
 		case MLO_GLOBAL_MEM_REGION_TYPE:
 			mlo_size += chunk->size;
 			if (ag->mlo_mem.mlo_mem_size &&
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..9d9174c6ee60 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -177,6 +177,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	AFC_REGION_TYPE = 0xa,
 	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
-- 
2.56.0


