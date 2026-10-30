Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42322606A321
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cR/FoVnO;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C+847oSO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZkMDNCTbHZPjo1kRABP18CGjONpKH16ExnHAKYrhxSk=; b=cR/FoVnOVR2RtOLC8LDRSPpEG1
	7suC9aMJ1o2iefC5960TPl3+jz1kOSX53Fkhhp1CDiPdZRiOPlyeWp/XRzvpN/lynI08PoOPrexK2
	48Q+NcyoL1IZpVJ9KQIEytUU5cMf8FPkwI6FUErNC5SuuLT5esoSfvXytZkJ/tmL3f3YEcYQ45SJq
	VDoGMoNvCKQZxx3pu38DwOTc7w207fniARIzyBttaMuH5we/s4FWUgUa7sW5HeRmo1kpeVsLR9rCJ
	9pUEfo91HAhUigOeynuhJotVcPnRf7aStoe4WcMdef5Ge3F+RqCbIPHl8DgrNMUF8uXyC0Tp4T3Q8
	EYRSWycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMic2-0000000BCoY-2K2x;
	Fri, 30 Oct 2026 09:09:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMibz-0000000BCno-19pR
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 09:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793351361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZkMDNCTbHZPjo1kRABP18CGjONpKH16ExnHAKYrhxSk=;
	b=C+847oSOFbiD6B31Bp/pI0aX/43IolVSXSJXLiNvc3GYy8fwDA9x8Ms/nZieZegt0yIf1B
	ZDZt+ChPSd26KE3WfsJbhAVgbVqPOCKI7qyMXPkrN344WiNiQY/qNHVH5CA+jDuTj3m7Fc
	wlDU0yf0dmnIKwBOm9ICQfMXY774+EM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-_isT2R19MFe_XnFa7sZTSQ-1; Fri,
 30 Oct 2026 05:09:13 -0400
X-MC-Unique: _isT2R19MFe_XnFa7sZTSQ-1
X-Mimecast-MFC-AGG-ID: _isT2R19MFe_XnFa7sZTSQ_1793351352
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59E2E1955EB0;
	Fri, 30 Oct 2026 09:09:12 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0AC11800495;
	Fri, 30 Oct 2026 09:09:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] wifi: ath12k: fix wrong register read for RU start index of 80_3 segment
Date: Fri, 30 Oct 2026 10:09:06 +0100
Message-ID: <20261030090906.298234-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: cJ5mTHKnGFN7-fOYVwb3LNP7-N41613X3lay2je6FIE_1793351352
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020923_383607_0C6510AE 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RU start index for the fourth 80 MHz segment (80_3) is read from
rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
(HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
it to info2 extracts garbage bits, producing an out-of-range shift
exponent that triggers a UBSAN splat:

  UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
  shift exponent 284 is too large for 64-bit type 'long long unsigned int'
  Call Trace:
   ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
   ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
   ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]

Read from the suitable info (in this case info3) like the other three
segments do.

Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 module")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..0e69d9fe138b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -293,7 +293,7 @@ ath12k_wifi7_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *r
 	}
 
 	ru_type_80_3 = le32_get_bits(rx_usr_info->info2, HAL_RX_USR_INFO2_RU_TYPE_80_3);
-	ru_start_index_80_3 = le32_get_bits(rx_usr_info->info2,
+	ru_start_index_80_3 = le32_get_bits(rx_usr_info->info3,
 					    HAL_RX_USR_INFO3_RU_START_IDX_80_3);
 	if (ru_type_80_3 != HAL_EHT_RU_NONE) {
 		ru_size += ru_type_80_3;
-- 
2.56.0


