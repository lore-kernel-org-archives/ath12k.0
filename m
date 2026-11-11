Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FA60A2616
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n0R8szLa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KSRTxqsk;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FCD+Sooi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=; b=n0R8szLaint0v7
	QVOjJ7KRZ/UXbLGFVmgggXkJa0wiM3/rMGblB0RTLizxrbGvurNE8aRy3xZWFbXtEmxQI7aD8cSFa
	ZNaRVrGOLqSegjK7Ux0sOQFsLG9xy+siu+VMtLcX7PatJWwYGdTqLd7IMLSICYu9ZKHfP53aQLgOQ
	N0mvskH76BHHAY2Ok813g6QrPyvV9tsrBWqSTrEmCFds9OmRw3P5+xABB/yGrfcAW95mGAAKhh8/3
	SejKdYEhF+2ipI7RoIGAkZk4S2NJE3cANf224XiMoS5Q7QVeyKdw87KfIC9ZKFdobHp+QBeOR9GUR
	Eh771H9pqUZkc7JGel/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lu-00000005zXZ-2p7j;
	Wed, 11 Nov 2026 08:06:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lt-00000005zTF-0Iet
	for ath12k@bombadil.infradead.org;
	Wed, 11 Nov 2026 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=; b=KSRTxqskYaNjeXyyMsV7RZAkAP
	cgoacApbhsCyXRgoqjQNrpHZc8zeYUCkX9GB0ciVpekRfzU0yP4UIy+NqBgGmZmjTRZDzTHI7/xr8
	b/rpnX/oID453nFED5mG/313VjDFrWdEJK74Eua0qcKsEZmJ7KHwv8g+3d24V226kWJqZjmjQaNOi
	R9ckhgTzAlCaEZCGhU4jtIWpeKytkixUN8hm92C2TV46ylLmEB6RQJ4cKsRtjMdlUXfxHDD95S7xX
	eckltKf0Hx4m/OeuYbswXUXm9BZf4BVCbK3tsu8B/6ewWbkEK1pItJbwqkhblZAuUh7b0wqfCEtbI
	h7qf6EgA==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lp-00000008t6n-380O
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c4395d31228so386009366b.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384395; x=1794989195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=FCD+Sooiu0OiGaONm0kBPganakH8RiYAgXTEvgWgqWIEjsf7FZ2mi125yRSVJWntFs
         itgtfCZy0LWu+HMxfMmztEIhznxvXD+b8pVOGK6hd5Rxe1e589YWzs8d4H/IGsos3szR
         qycGz0meft24YSCJcLDwK0Q6GczGVYRdsyJ1GotXTgbN3CPPiR+RoN1Aby0JF71sNqQC
         2fKxR4B2W/r8xIBshDoWfx7wfwbX6atpfzvtKzjNMsMzzy8HoFysMu8P8UFOZf1NZLxE
         Nbz5cL3eInePVTZIcuOCM4T5CuokB87JFkfvQ0iOjtZ7KVl2p2GWH1ebUi6wGyKM2gwb
         6b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384395; x=1794989195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=ioVjPuGQkwlNe05p7vLuJpMJP7BmLulepa+t8RnSTVYjRSCDRg6Pc17XgFU4c6opsw
         1lrU4VgxsrunTyYp8zrL3EZiMlvrVqf13EZoKdTcBWAUUoSL6wyhOe2OaNM1lOinfwrv
         ulnizZJHQyaDkcvZ3Jf41/cls5t3P7/ma4K5+QmxORHZX72kDXBWPoq4jhCV9/FsAeS/
         rARc5tj1Jo0jcu41kOteQAP5Z2GuGxw7j9fX8Iv+t0BnFNohd161/jIxL59Jxay9cmCu
         oKo/PosH9rDEybPvtaBLwKhtE4Nzz7ZAzSzuqvPZbtFuir7PQMD8S900y6vvNIKa/oYo
         hZQg==
X-Forwarded-Encrypted: i=1; AL+hErEbpFMgmtkVILgUPUGCtBNHVYY7Ju4zmytuI1xuZxx+AHsEbBFeNKZydy3aBrWF2Hys7Tm9IuE=@lists.infradead.org
X-Gm-Message-State: APuU4Z884DEDbCAAyTvbDNYjTBpCWxgAa83C0gmAcjFDFUkUz6ciNH9m
	SvzMy/bTlxS5M4yTWtzEmrUhvesqsh5RTBNjSDSY6Q6VO5VGj6tNPceJYZiZFn3hbA==
X-Gm-Gg: AYBFou0EtBH0pD4L7ZqeSLeteNCImQxZxBBoLoRGSPIllvuYhrJe//eOKVldAFC32y3
	IV0FhDq95pEjUYTxclK67t7dmUg9xkU1AgnOTBLRK5rI58Ee7NXxd2Yb28tFsSAfzf1zaLZA+DR
	wLpGKLO8wZDHaVhzd126pTNzC691FDyqUkz3+HUuDXVyrEEeqvRANBuywsKMPFR9Fwq4GEmdzco
	nnUBmpjJoaN7q0Yvv6P9UmMKJ0sG8dDlasJR3fXUuFILA2oSA8UhRp3gSnVUNk0t0BzCgMN8MLi
	ZtiROlsH1rNifKwfyrkeJUh7msesv+7sARnf6fNmAmbwxfMZB2rg/qdsWDfm0yvWryXDIwF4sSt
	91pPv9urCkqC1B0n2NMayTQfWilaOHYtC/IFssXFoGeXmDT0TPcSY5EMkFWxKBkh5DnTEjhamRp
	c+JisIiNw49EgoOhVK+gKFP5qgjj5LBfXBloNL0nkAgWU5QPXF+E5I6neuFok4m4ZVIfFFWfGb0
	T0ozV8Nvn7cdcBu70MZHdlh76SOyuQaMCGSWdyFH7pcg8BAEQJ9KqiCJmi4PB1Pxiw6FZjk6jHz
	9vQIh1RyTGspjFUFcC5pkeqB6aNTZYOIn158eiW/ZED/lZpDmEgE2adCRTZu7lIgPTeEohzlBEh
	DkUKkyzYsVOOgksZdIYPUArw/OLZ8BwTGiJwWx92vL1FBWpg/sVK3DimBwr6lOce65ww9gnEdFH
	Roc8wh6RMck9UdvHgL6zr3Z7esi4XiVi7nKI6JqIA9DEE8LsC6ka5ED39W0YkvQexFKjADSsxxO
	xDstDFWJ1yh0O1a2VI7pWm7/jEmdLBIb6e0ZFjX0pUMM13Xt7MaBhJ7fJPLCEVSmgn5SqohJgZi
	avM8blxfP+nzaZB0eVQ=
X-Received: by 2002:a17:907:3d0e:b0:c49:d1c5:431a with SMTP id a640c23a62f3a-c5066d58e34mr133683366b.38.1794384395369;
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] wifi: ath11k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:29 +0100
Message-ID: <20261111080630.244427-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_080638_284924_C0CD8D30 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -0.2 (/)
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

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath11k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..c4e4b9c5ec0da 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3172,6 +3172,10 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0


