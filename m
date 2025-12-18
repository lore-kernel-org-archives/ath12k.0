Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A6D6E2B7
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QXaQ+YeNCSZ9diNB4X9iPboxvA9N/DwqVSLlHISys0=; b=H23ae+MaXgNog3Od33fVnxLG5q
	c7c/CQH8/YbOmv5GrEZaWbKOVSSFdKSh3ekje0ntQ8DxXNa+J/rEnpnrE9H1WglTvJrTfMxHcRBI5
	F+Pzk0U55qVTDn0Zbi0RI7kQLfLNduHIo1Xn2xHGdAULa0evyFaYArhaBvW6J5zz6E2SZ83LNyqwU
	+50F6OK20eVzwNkF7XSkRtqonT7UhcOmiMZwvqR+MK77YKHRlHaiT1DQkrcrkwBga0pHOrvPUp8vm
	7CtwoDq34ZUs3MJa74OZdCzKUYVjT+FJvCSSbTDYz1h5kz0WGuwLeXE5iU/PHiwoGA5DFKAYPTmvN
	61kGP7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMO3-00000009G3T-2BQV;
	Thu, 18 Dec 2025 22:22:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMNz-00000009Fzn-1DhC
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 22:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AC0F44573;
	Thu, 18 Dec 2025 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD22DC116D0;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766096533;
	bh=vYWy4tIF0oImarVkvgA+J57CDTRRyXKFwzAaZ9x3bZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vJXMw3YkJWHpdoYkFJ5No892fKm8XxyKGPxZyg9ZWS0XRwDwMtz+Pe7zKPlKe60/s
	 B2utiwVLPmqQkAX5i0PROrn4OaUxLNuZQE3i0YGYy2ioUq/J/YOAsXHFEYRIsIgci1
	 mNjbsekyb82ov+JaoKc34vMeVpr8xXx4FewxID9mKBrMNv6UMMu/EF1D7W1vyGHJUP
	 eYQICCh/71WuAZEY3NEP2PXN7/9Zal7bLiNitBmlNhxNNqizcSLgS/b77DWyz65PmK
	 tjnHibCEsvggiFfx0WskUR1NAY0FcIKQ7BDdZeigk5Cq5oFCb/dpLwMKXTTscbINZd
	 nZYfi2NK2/Ctw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA8DD711C8;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 23:22:08 +0100
Subject: [PATCH v4 2/6] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-surface-sp11-for-next-v4-2-7bcf83c1504a@gmail.com>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
In-Reply-To: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766096532; l=1478;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=B9SXON9447NJlyUwxvW/LOflPUSy2K70Poc9F3eFNw8=;
 b=6xy4ZN2Bjipgy1VaHvOCUKuf+yH/Mwv9z9bRIvBwuHX4VgyxuYeIgU+DmyJ8ZLuMxdFi2O8Zg
 FBtzIHdvDsiCQLpPSCJJ2htZ+OBPAS780TQyhpkZ5MAspDpo8dsPINC
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_142215_365868_DA8BC060 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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
Reply-To: jerome.debretagne@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

For some devices, Wi-Fi is entirely hard blocked by default making
the Wi-Fi radio unusable, except if rfkill is disabled as expected
on those models.

Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
disabling specific features based on ACPI bitflag") added a way to
support features set via ACPI, including the DISABLE_RFKILL bit.

Add a disable-rfkill property to expose the DISABLE_RFKILL bit
equivalent for devices described by a Devicetree instead of ACPI.

Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
--- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
@@ -29,6 +29,12 @@ properties:
       different 5 GHz subbands. Using them incorrectly could not work or
       decrease performance noticeably
 
+  disable-rfkill:
+    type: boolean
+    description:
+      Disable rfkill for some devices on which Wi-Fi would be entirely hard
+      blocked by default otherwise
+
 additionalProperties: true
 
 examples:

-- 
2.47.3



