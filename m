Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AECC88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPWwjv2lCc78jyciiGeHhfapHx7+w7VurSqk2gEfFB0=; b=ud29v2bB6n6faYQsWOaxMxC9TK
	nJXK6rV5l9E/g1hmJ3J8UQCSGxr046IdDTKczuCtAimymvgZNmR6piTnlKjzdulpzaAESRhZFMmz4
	pT9SUFlXyliW3nqwqe04R+7lJn1b2MXuWblsZIpSpZBLtJ8vFONqSzOKy4OtIa7D20Lio5FuQ14oG
	XmPPImGJ5X31AP/6Kp2j+joxiPWSA11puLXpcSpBhzawMYnpMyXOLgOjZDO0+uoI1y6GhCFVvn/yX
	/Vph3jjUS59YFX9jfvUg85GhrMa/U0387kqua9w/YNqzH6B5mdQLCvi8D5hsuNJgkxqYT0O7x0lK5
	ftRdVW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nr5-00000005WAw-0TwQ;
	Tue, 15 Sep 2026 07:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nr3-00000005W9Z-1mBA;
	Tue, 15 Sep 2026 07:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WPWwjv2lCc78jyciiGeHhfapHx7+w7VurSqk2gEfFB0=; b=Xpvl52eqqhloD+jZKNpndCFoUG
	ecIEjuvTjAi78JWa9geGW5NZNUYZt5TUd4s1AL8qs5EMVLZAGDK9zzXn64VfPlBtwN00/xqwMVCHb
	tS0CSWum46xO5zLWga3oFavDdlM/UDO2bD1w1MihJr/MoeguoeCR6hb9JLly7dLab6bb5IahcutaL
	7h9lCZyAw4S5Pp0+eLmxKO6ETT6mpqQiH4J1oOFWoKG8cqccj3wJy64b5zKCllINMiO0UxYw97pRX
	co2nNL0+ApNVaYUEbnG4aAr4u56fAj9KKWRbsDZE9Z3QRALBaJ76DUaRu2r3jhtw9xDPNavDyDA4n
	kHTB27Bg==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Nqy-00000006OEu-3a12;
	Tue, 15 Sep 2026 07:45:23 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkYvv061Xz49Q6x;
	Tue, 15 Sep 2026 10:45:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789458315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPWwjv2lCc78jyciiGeHhfapHx7+w7VurSqk2gEfFB0=;
	b=KFoazCVbt9KjJ3uE4qMhMFoxJ3RdjvAoV93BUqES91xZ5TunfAHuyNPqJVoYV56FWUf2A4
	2ZG6XTr3PoNtNstubzTRS5FVJx39nN7I2En02rmxpFLj3fee5hvEWgYcQzN/uK0I+5tmWM
	3sfZD23cs3A3EppZvQKpVsVU3pSNsIxevg7WL/RKD2g9yUfYsIxGSoZpBl0LMrC3YPQ7rT
	27oUcf5gjl2aMFT2sH9ShomIfWnZ3cU2usgTt4RMicFy3fgVpem0i2fFD68EiY8jfVaY8a
	fJ9VWQ6vLMN91QurBrGoMBjwtvYX2bPLI2r08r8dStb1E39pZ+Uz5zHuiH9jVA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789458315;
	b=djaVSyXl+sHFFQp9z0hvr7LYJsMM5kDmhoV54l4z/UWqTLOtO9mHCgN6nkWHLBcboy0L+8
	qwXSuPuMccwDi2J9UBK9crZL1vjO7M1r5JyTWatu2ZXVw46oNvLWzt7BWcpsy79FlpEMr2
	JjSiN7ZnLDrz4ODOHgQHi06nOvJz8ORHYLepwZcx5/Nc2UYQN8sbOQhk+miPEpa7cPLf4H
	MjLvhCaqPZYSI0IgXA8ollhDsfqPSnbIfAlJP5n2SB4z4eVCC+cxiNY6Obuz9USq7GfkiS
	euiBKqWgDyarF4O9yUe1FZfnONCQd3/WLemMTA64VIj48TGCDQJwRCk3aHsNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789458315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPWwjv2lCc78jyciiGeHhfapHx7+w7VurSqk2gEfFB0=;
	b=UHzuubR+VxZYxtNsV7lm1EfJL397Ya7G/jGTvzmJf/Cm8vYH0CuaANguY9y7Gukn2LzwAy
	EKImPMGeNY973ne9NTmqvJ7alPj9hNH8+F0GYG2H6cFKr2f0PW6yHX8DTghd5yFjRWURCX
	gZ5fbPz6cn74cTTpbquW8vuUXtTYnUveM5qRn1BjsMpHR2S7Ymzivuu4/Ji3jxqJJ2KsWe
	h8hJlKXixqEPI3NnXx2Id50ezzhMMUQt+g1Wne4wrTePrM4vT07sXFS4mV0WbIjZG1rdT9
	767mQc3LKguHz8xQdqk2FLifW9+fAQ3AtmOUwccVsoWbf1hzXXEt+BlBVs3OlQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH v4 09/12] wifi: ath11k: bind to QRTR endpoint ID in ath11k_qmi_init_service
Date: Tue, 15 Sep 2026 10:41:32 +0300
Message-Id: <20260915074135.2567411-10-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084522_409568_2E9C2BAF 
X-CRM114-Status: GOOD (  10.72  )
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

From: Mihai Moldovan <ionic@ionic.de>

If possible, fetch the QRTR endpoint ID in ath11k_qmi_init_service, just
before calling qmi_handle_init, and make it available in the qmi_handle.

qmi_helpers will then automatically bind to this endpoint for us.

This finally allows using multiple ath11k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all).

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..ee5effc113667 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -16,6 +16,7 @@
 #include <linux/ioport.h>
 #include <linux/firmware.h>
 #include <linux/of_irq.h>
+#include <net/sock.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -3324,6 +3325,13 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->hw_params.fw_mem_mode;
+
+	ret = ath11k_set_qrtr_endpoint_id(ab);
+	if (ret) {
+		ath11k_warn(ab, "failed to set QRTR endpoint ID: %d\n", ret);
+		ath11k_warn(ab, "only one device per system will be supported\n");
+	}
+
 	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
 			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
 	if (ret < 0) {
-- 
2.34.1


