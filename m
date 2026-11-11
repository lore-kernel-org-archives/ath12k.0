Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0F60A260D
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYrlDl1/;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SoUG0BXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=; b=hYrlDl1/eoQKfB
	3jxNF7/MylD5JrKY7wTYWwNknGS9UqwlWWzbLcNGWcxzF4bewDvvYyITxqF7JQzN5qoESFH/Rzw7T
	gy8ELGFiZG0SEZ1pJAYqPtNgfP8fBQTRrEGNps6lscpkBzbPM1MApUe+/31KgGbNFJxCbfDPviC9E
	yfEQU/DqeMraPylc+UXD6ylrhIx7ldOzGTwMDXw9cGsSivRnGa+mvvBFMYYYQKoSIfHjTyqWRpaFA
	wZDUusPfgd/kUcy6Saj4mtJxARLV6XHczMznHzkSja3xBWLd/67Wj4oDPAPMwFIsnFTh2VkygIwn+
	Cw9vNUju/DavlNuwoQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Ls-00000005zTQ-20Lo;
	Wed, 11 Nov 2026 08:06:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lo-00000005zLn-1xM8
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c4c9abc1824so408434366b.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384394; x=1794989194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=SoUG0BXkKCVMc4MESwu3jI7xEe+84mJYxv14UnHBQV0R55hgzS+G0odWtmMlk6XP75
         fr2JQ1ySflxvPC8L5uDXVyoFGV+UykrA51PsXt48xZobY6PUb2I3Ajh77oM9oVuVFkK6
         S0ivP7JlijfgHjZmx79pjD/iTKulPiHTUShJdhjcD8sP1MTdUcz03hRcrsBP9JjdNp8v
         Lly7zY1gmIG/BISd0hIA6TBocWeFQt9WTAGY5Rrpd7EsGCGdPNVa0KzQkeBcukuLeP4t
         vAw6XY18LlOaJumzBy/O9gK6WdzA+qtIU3OgpUCU5VhoIu14ba8qnXjzxrtK20cRD7Tk
         5KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=nh705W7ghzPE2DcFx3Ltj/+oQxgszIdqvPr2U3507iZ2Wq8E6/IR2uY8f6XlHQOB1K
         Y9p5g/UEWNjgmmQMbEFGlr2PlVRwj307pM4wLjr7Cc+YBy7eBDXDYovfoWe7SRjkYy81
         h8Mxt6iUtFD/3xIg2emcsAzILvm4IgX0LnBmPKrtB3peFcu458xaEPg9jzpWoiXFKwU+
         09J9SiIyRASb9BXmw23eTkuPPdS2lUMXzW+E2xZ0tTZpsWJ9BY+P97HfWGL0aL3nANvX
         YoMXcZF1Ikuqt/UODwuE7t94ib/PVBle75Q7mzK7lHq/SYs0VPWU4dYT9SnCLXmu3ETW
         WGlA==
X-Forwarded-Encrypted: i=1; AL+hErFSvm3pKVpQJeg68jrFYn6EeMluY9Su8J3MibtgD6O4nJvlF6QiQLOrssY6XF16g9SCJIxdD4U=@lists.infradead.org
X-Gm-Message-State: APuU4Z8q5GuhXs+RTSdKs5gDZc/9a4wOVDr9ywJuTXgus4BJDzRsf3Ld
	RFd2ELKWsj+1x15KSHIrxp9CBQFBvCRA+bK79AVDzWD4kEpU4HUCIoBWf9vUtEQh3A==
X-Gm-Gg: AYBFou1KSLD2ThWrsxJ7QEYuccxdGOUfju0WXxs4LJUsb1ah5YXp3bJ8yGr/lE3WjwH
	Y/5xkBHodr5viqSmq2C1ZgKbkm//kRdM0Q5z9UxcY5KOBF8Zb0agnp6p+VRVHNcfVXY/0u+REXd
	yXudVdnuB9Nvo7djBq0L9akXMvqIFlQ0nKJp0GCJnljsT423FcW0lc9a3Bq/tJ6tLpXUJ4d4dpH
	4to9kyFhNal9OIQaJtM206fgikPctrbYJ4O4Q6j98cUPJpUO0KZE7TpHvoErN/rD+eqD3JVl/CQ
	VVvp6G3Gig7EN++EUzVKMHHIoe6rZeJDGQSnNKnMmeew/U/Z+wphx4dE+iKVOk+ggzYHzLdMJLD
	+aWGZAtsyGRrWEVPy906XLxDjr3+DgX8JGIDRbpCszwum8ox+Ku1VcvSheNK4GfO/t+/l9wkjJN
	5Tvxjr20KqLk4/7H6qI4+HZLVwrr5fc9nX5XrtRVCwyqOIVHW15Vkc2T0Nnaudrv1NtShZrL+fw
	KS2JUx3YdSBhamWhgVQ54q1oivjw/uaP18xO5j4Twf/fJLYyeq21Uu3dfqUa/qqqB2vY4VTGVUc
	huhcKJcbU3qUv5D95k4UeRfOLp5kIh9x7IHoB46A9gIQFLDtC7gOszc2N8YAT7r87ctuBpyPt8+
	R2Vobjg5F7RZJiiaoxQ9kRhTd2AO0PR41vbh+fWpi+DpDRqpRGfOxnHpo8adPvfQGSTXfQgPdyb
	fSYwN3ED61PIXXtVZfj0jgequRMapONE5eWW5VF79a2cQ0bXTHedqPMlmleMZ8wzrlQTZ6GCPeL
	W4TmiPRSBZ/EwznwT/XDI7CM/C1S4ndzPl9ZEIF7wiedQenJlEHJ1ACykdZ920AzKRsBsk1u8go
	7YTXZW09UN40m0wOKzk=
X-Received: by 2002:a17:907:1ca6:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c5066b338dbmr122198366b.30.1794384394508;
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
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
Subject: [PATCH 1/3] soc: qcom: qmi: Take responses and indications only from looked-up servers
Date: Wed, 11 Nov 2026 09:06:28 +0100
Message-ID: <20261111080630.244427-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000636_537865_23DB28EA 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Any local process can open an AF_QIPCRTR socket and send a datagram to
the port of a kernel QMI client. qrtr_local_enqueue() queues it no
matter which server the client socket is connected to, and
qmi_handle_message() passes responses and indications to the client's
handlers without looking at the sender. The ath11k and ath12k
REQUEST_MEM indication handlers, for one, then free the DMA memory that
the running firmware writes into.

A client handle learns its servers from the lookups it registered, and
qmi_recv_new_server() keeps them in lookup_results. Drop responses and
indications from any other address. Handles without a new_server
callback keep no lookup results and are left as they are.

Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/soc/qcom/qmi_interface.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..ba9d973279145 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -469,6 +469,19 @@ static void qmi_handle_net_reset(struct qmi_handle *qmi)
 		qmi_send_new_server(qmi, svc);
 }
 
+static bool qmi_is_lookup_result(struct qmi_handle *qmi,
+				 struct sockaddr_qrtr *sq)
+{
+	struct qmi_service *svc;
+
+	list_for_each_entry(svc, &qmi->lookup_results, list_node) {
+		if (svc->node == sq->sq_node && svc->port == sq->sq_port)
+			return true;
+	}
+
+	return false;
+}
+
 static void qmi_handle_message(struct qmi_handle *qmi,
 			       struct sockaddr_qrtr *sq,
 			       const void *buf, size_t len)
@@ -485,6 +498,11 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 
 	hdr = buf;
 
+	/* A client takes responses and indications only from its servers */
+	if (qmi->ops.new_server && hdr->type != QMI_REQUEST &&
+	    !qmi_is_lookup_result(qmi, sq))
+		return;
+
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-- 
2.53.0


