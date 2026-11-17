Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A343606A885
	for <ath12k@archiver.kernel.org>; Tue, 17 Nov 2026 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iqJdxSl2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jt7UtO/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=; b=iqJdxSl2+MdvVz
	gLvHqVhAxgswraKEo0vVCY4XYbWeQ9jN8nflIe2cSz9+CrBpWFYk7PMRbT9i7mfEo1Rs6mfmedTEN
	jZP0r4WJeqUSiifL6fGGGwIs42wz43DFsRJP4tbQtpVHGpFti/jHLpuVhOB/EIWY6sH1lydmva0aA
	yGYWothakL1HT1jc9kB1f+8r81gW3Vl7pgAY7rigKACk38zkWtnHHD9urD/F+W90/zd1yAAZFVZnt
	5stSlDx9Hu2fkl0RR5f36/RAQt+uUFCYfO9JuQ+Ri9C2i6BL3cFysl5pHg9sjElXRuCXkJrcwyDGO
	oCYTHhczCSDpvLYaRFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC7-00000006d5T-3GUD;
	Tue, 17 Nov 2026 17:42:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC5-00000006d3y-0aQi
	for ath12k@lists.infradead.org;
	Tue, 17 Nov 2026 17:42:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a32576da88so14476f8f.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937327; x=1795542127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=Jt7UtO/cHbLk5sVyVWTSuPUzgLQePeUkjuqhx0KUokQVXY/ycarOFzWCtMAuY7knKS
         FIXwHtNFMvUYamyoXzGQ6RbMFCN+puImEO4A1VZ29iz0nSetF4JU/fuRhc3HDlinOtD/
         SxniVVqMaFCybHNGzGzgkCgw400wx4rt3IkS4YB++2wugMY1qWoL123NJ2ZNaie+8vpc
         s+qG4NbXae3QmhR5aq8yGQY49TtWaaLi75NVMfDLwT/fFQpr6+d3NFP/MoxOSVH76I7T
         PAuWnj2qb5GITSDo3aCuKEiUCE7zlnPc23+cuEsu7Xm9icnWRiHgVpNg+j+ldL+/CTJt
         1yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937327; x=1795542127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=B49V/IiK3/yvxPN0QJogWabneknP/FpZX1ImkDHGHs2o09hJIuW2qaxNwXn+LM0lID
         h2ioFJ4RdDl8Gd4KEP0yB52Zykqpcygjl0rRoXXOpWLN002mn+0t1G4/8JmUYGPExjPL
         d+Pp6I72rvYL+8ueXaLoFlV364HKJPKo5BZDNYHN3Aym7I+G153V4AUeTyTk/yRB0z9G
         H9hD6lxB93oW6jcr6KZsB3mz3NZ76mksOqhs7q6/GpZUAmiFaQ/ADMYRDwc7mS0YlxI0
         /fGTFRGD/Sa0sSjEtx3mJsAhlTJ45nLfg93TJrzX1lATf0dKh1IZeKaxT3YRWN6tQRxQ
         v8Rw==
X-Forwarded-Encrypted: i=1; AL+hErEvkNF7163xBop0NVplx5aNqNfirue4RhxL+BPcsWA1dxE8x5r9iM7ahI/6iLCHo8KVvmPIJ8I=@lists.infradead.org
X-Gm-Message-State: APuU4Z+VAp0VJ2aTNIRofDrxMwNvxKSb9oCZEhtompCJ/IBk1QgsFIPN
	GTw7mCaxh2u4LCb7thqav2hItXWnQNjzBsGprRA/UkuS3kX8BOAhKDI1
X-Gm-Gg: AZFdTZcd0jWMZi8uHs7VvBreaFjAy3Eac4H3xnV8oKSo+KJuKX5V5zbXyxFuYz8armu
	jBXUq5ihCgeQHzar4jgFipL45SVgdqtWqmzOLTyWT1RvT06WPCQNuM4ZInVdO0HgZJqoF9p2/IG
	/j0P6jYqJN4cSukNnmLRTeFKohjz2tcTZ1YzVieDZIS2r+S8bHahGQt7J9ijhIqGmpY1X+ZzjJl
	BhZkOj+qEevQIh+997dED5lF1L/t79BNfUMmjGXoofOI779M5t9nJL+A8Ox3ZjKotmttCeDxQaU
	ZUGoJG3HojEuev63RJLfdNN+BNAumyIkRNlT0TI3RkHDLZaJ23V2FnyKvdH5Mxp7u4FBJFptHkS
	BOytptSJfNBZAdRQqAymtQuisAH3/Jz8K8n6DYv7J4iWufeOnVYsxDhhaqzC96rcReNV4CGv7/6
	kxb2rGzcP+mcPkq+33Nx6QKJsHCqnYBTob/Z7IeGPxvmU6BUfRJfvnUMWbDgfbjG8+u/Nu63h8z
	t+h6gTAxZe20RRz9XsNT3YlG3z8TqMvNfGvGjPkHlJR35lWHTqNAVX9oBZzP7+rgF0mO/QhRIeF
	RQj1sYZh52sCniUWYUUDX70hF0FQoUFuwF1cIhDR38oXhwHESEKjhkW55Q==
X-Received: by 2002:a5d:64ed:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4a638ae26abmr362462f8f.12.1794937327122;
        Tue, 17 Nov 2026 09:42:07 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:06 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
Date: Tue, 17 Nov 2026 17:41:55 +0000
Message-ID: <20261117174154.549590-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094209_214603_FBA0F515 
X-CRM114-Status: GOOD (  10.76  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The binding requires all nine WCN7850 power inputs. This matches designs
where the chip is placed on the board and its rails come from the
WCN7850 PMU described in DT.

WCN7850 is also used in modules, such as the Silex SX-PCEBE, where the
PMU and its rails are on the module and powered from the slot. None of
these supplies are connected to the host, so there is nothing to
describe. The DT node is still needed to set qcom,calibration-variant.

When the binding was introduced, it was agreed that the supplies can
be made optional for cases such as M.2 boards once the need arises [1].

Make the supplies optional. Keep requiring all of them once any is
present, so designs using the PMU are validated as before.

Link: https://lore.kernel.org/all/87ikyenx5c.fsf@kernel.org/ [1]
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index cf3e1fd99c12..27f443bbc401 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -63,15 +63,30 @@ properties:
 required:
   - compatible
   - reg
-  - vddaon-supply
-  - vddwlcx-supply
-  - vddwlmx-supply
-  - vddrfacmn-supply
-  - vddrfa0p8-supply
-  - vddrfa1p2-supply
-  - vddrfa1p8-supply
-  - vddpcie0p9-supply
-  - vddpcie1p8-supply
+
+allOf:
+  - if:
+      anyOf:
+        - required: [vddaon-supply]
+        - required: [vddwlcx-supply]
+        - required: [vddwlmx-supply]
+        - required: [vddrfacmn-supply]
+        - required: [vddrfa0p8-supply]
+        - required: [vddrfa1p2-supply]
+        - required: [vddrfa1p8-supply]
+        - required: [vddpcie0p9-supply]
+        - required: [vddpcie1p8-supply]
+    then:
+      required:
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
-- 
2.53.0


