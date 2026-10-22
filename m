Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073F606A326
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eqjhw44s;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ef5fn6MS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0+2f3s0CtXWQrTFVVsiCaUvhU4+K4IjiLxQuIlkAlO8=; b=Eqjhw44sWR6Z5BNzT0MpT2usnp
	yJC7dyFTWmMYacIwuFqKHgHUJWpBYDRysfusX/cFVxeXgLkJwMBtgl/HtrNdR0hF9yvrJsSeI6EIc
	jZy/a93TdOG45mv656+yEYy6/Vk1l7NaIHn4LAdh+SaLJEhEnGDfYog2lNHhmItDQu8ooR1hgGD+b
	JxfH4UkVf7RIwecg58r3dliPtmuqnOhOf6SaxOrI+3/NUAowE38oZ48Wrl8jy5l9gFXioHxRJMXsd
	/adwQZv6hwd3EPyXxL30JWpk/tt81heuD3fHckQduM2w8cDJDXEg3XI/bh8NVmug2xXZIysjoIhK/
	eNvj/vWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlR1-0000000DOt2-20YQ;
	Thu, 22 Oct 2026 05:33:51 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlQz-0000000DOsa-3Rn2
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 05:33:50 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-35b2c599f43so3288843eec.0
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 22:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792647229; x=1793252029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+2f3s0CtXWQrTFVVsiCaUvhU4+K4IjiLxQuIlkAlO8=;
        b=ef5fn6MS+un1I+lxecWCBExqAH+pSYUtdeNaWRswUW/6hi1T9a/fYOS4fRM1pn4/If
         utofSuOav3U+UTJgSci1vlrnEWc56QGtRXDCoFS8RyzAjKQ9/4VX7ers0GRkJCsoV85s
         JMSP3VErdrW8OsR0NX6Wmh0jSjM++CF1enSybOqF1/QxWm+qyqPQwRgFafUSGqtO2J5O
         wOooZ7nUU861FrVBHteX+lSN03QihJYC+Rx5Xi/ErY4aWNVnSnkDDUB2+tBT4k2hHlvQ
         l/wOb0o3Y1FUKuXwi/x94IUYIiXw2ej6HUFYbvANXS8hBn1AInAgOR6pHKvhSJs3KnSP
         3QMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792647229; x=1793252029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+2f3s0CtXWQrTFVVsiCaUvhU4+K4IjiLxQuIlkAlO8=;
        b=0gRnezCTcnZV1CUv00hpNSE+vO3fvbWf2m9TsGld61D1Pi1TTRO6e9QqkLgzQorEeW
         hcUhEmvzj6Apd/LmG9Fh8kd2v4307tzkA8As8yV6tT1jLB08ks44b9OKiVrG+CgrR4i6
         blhGVfrvO+7eMfg4GTgBfn+aCvJsuvNkVyc8c6R6/uDJz7NRA4z3QjMlu0RlMRdJDmNp
         ISyOhTF8SV9sOwJVV+M0FROm5qd4jBIPLd9oB50nbsH0vI9tPdemUBbvLqVxQkkyyHgv
         AJkaAavLiFDULdCGM0+7CWr0/2VEbDRlVi8XDKw9BgguV9c7rFMWpYtViRjaP+6MV6Ng
         eEbQ==
X-Gm-Message-State: AFq9FYJDDUqrO64Ule6UUQcPhVAtOn7ZPZONO68hWzY7Bdx/yikH68T7
	u5r9F2aloNT+v8LxXterVGNpfdvOMHhVS4mS11Cjc/61wIbl+GCtlrUDA1xWpWPUuTA=
X-Gm-Gg: AYBFou1TGJ6XJTlKRL8xUiQu5wv6AfzAsroBbL0kygfBdBr5DNdht0CVWE/DCPFIIDY
	TT45aIFy5sai+6JYmNRxIT9vEa75Bijr2qG3XJ+GaJjiyE8tQCBFEFsag7+fLucVYU8+MxZ9L2k
	1X2Alo/qr6+uRkenjtU1goC6RpwhUEtZalqgB8ONFkYyFsIqB9ChsLmsOf9oecSgAOgGYHEzOq3
	tlGRmXHNhrBz0UCE8ckHDA2V42tqfhjfaKkW6qLLbh7dmFpSGZ4/4kX5k7uiWue7SAgZ/SRuiE7
	yUsO66FxDcOu5PmAUt2l2Ufk/cL7h0ujiuMKuN+usQfGxlr1q152VSQOXtk9j3MB6myy2D0pPOF
	AfF6MaWMvRBfqm0HbwThDOImWgyAaKZyjyWlSIFVpYkB7U3Uo4UMYMAXh7hsBm8uwsw0lNq87O/
	d2q09ZQYtUj0ok6wPf/7T6f7LMG0XO5iS68xsM74w3Sn3t+82XmHeBVRB+kfZzmfHnBkS7+D2gB
	C0k2sK5O+DeqASKP5VQ/mgDZex+uq7KCXmr+u+5xHvupjwkpVf9u9MbFm0EwnoMc40Z8ShtkSjN
X-Received: by 2002:a05:7022:7e89:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-190a599a074mr6253784c88.21.1792647228908;
        Wed, 21 Oct 2026 22:33:48 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm11654331c88.14.2026.10.21.22.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:33:48 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: ath12k: ML Association Response accepting a partner link is not transmitted when the 5 GHz link is 160 MHz (QCN6432, WLAN.WBE.1.4-01734)
Date: Wed, 21 Oct 2026 22:33:21 -0700
Message-ID: <20261022053321.1897324-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_223349_863112_899ABE68 
X-CRM114-Status: GOOD (  11.38  )
X-Spam-Score: 2.6 (++)
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
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On an AP MLD with a 2.4 GHz link and a 5 GHz link, an Association
Response that accepts the partner link is never transmitted when the
5 GHz link runs at 160 MHz. At 80 MHz the same response goes out in about
2 ms. Single-link responses at 160 MHz are transmitted normally, even
when they are larger than the two-link response.

Setup:
- GL.iNet GL-BE3600 (Slate 7): IPQ5332 (2.4 GHz link) + QCN6432
  (5 GHz link), ath12k AHB
- Firmware WLAN.WBE.1.4-01734-QCAHKSWPL_SILICONZ-1 (also what the
  vendor's current 4.10.1 image ships)
- OpenWrt, kernel 6.18.55, mac80211/ath12k from backports-7.2 with
  local patches (diagnostic logging and one REO descriptor flush
  change); hostapd 2026.08.07
- AP MLD: 2412 MHz EHT20 + 5180 MHz (channel 36), EAP-TLS
- Client: MediaTek MT7925 (two-link MLO)

What happens at 160 MHz:
- hostapd builds the accepting response (485 bytes, primary link and
  partner link status 0) about 4 ms after the request and submits it
  over WMI (return 0).
- The management TX completion arrives 185-236 ms later with
  status 1 (six observed cases: 185.4, 230.1, 235.9, 236.0, 228.3 and
  218.9 ms). No accepting response was seen in an external capture
  (capture absence only, not proof of no transmission).
- Meanwhile the client retries about 100 ms later. Without a hostapd
  change the retry gets a partner-link reject (295 bytes, which is
  transmitted), and the client associates on one link at 160 MHz
  (authentication, DHCP, traffic and 3-minute stability are fine).
- At 80 MHz (same channel, same client) the accepting response
  completes in about 2 ms with status 0 and both links come up.

Size is not the trigger: with a 200-byte vendor element added to every
Association Response (assocresp_elements), the single-link response
(about 495 bytes) is still transmitted at 160 MHz, while the two-link
responses still fail. A DFS-free 160 MHz channel could not be tested
(channel 149/163 is not allowed for AP mode by this firmware's
regulatory data), and an 80 MHz MLO link on a DFS channel (52) aborts
CAC after one second, so DFS involvement could not be isolated; at
160 MHz on channel 36 CAC completes and the link comes up.

So the failure appears tied to the partner-link setup on the 160 MHz
link around the time the response is queued, rather than to the frame
itself. I can provide full WMI/hostapd timelines, the frame bytes for the
80 and 160 MHz cases, and run test builds or additional logging on
this hardware.

Is this a known firmware limitation for QCN6432 at 160 MHz, or is there
something in the host-side peer/link setup ordering at 160 MHz that
could cause the firmware to drop the frame?

A related hostapd change (replacing the AP MLD's own stale link STA on
a retried association) is being sent to the hostap list separately; it
does not fix this, since the retried two-link response is not
transmitted either.

This analysis was prepared with the help of an AI assistant; all
measurements are from the hardware described above.

Thanks,
John

