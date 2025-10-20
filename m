Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1CDCCD199
	for <ath12k@archiver.kernel.org>; Mon, 20 Oct 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFv7GXwF154GDvTPJSyCddEbZ8oE9v2v0Jdmp0obM2Q=; b=rMOGZOS+lt+cLlHuSlG7P/ht/T
	ZOVxDDQClDS73n3DS9URU/BE2Da6CsrdXwoU70/PR9aTkDWw7+/UR+CNf+J22WISfZSW3/vgz9AIp
	b4ZP7Q+Oge7aZcBpWYIP+iea4SyD8MGQaTBRCx80NpR1cJb1j46DPi00aFZewnvjutkZ9MPzR7caM
	91S89YMsFkfOAPIcL2X3PYaCBKq8aATnXroh0w+7OQefw7wG/cwkRxyXqR8d8Ip75gNDE1N6Hfsqg
	nL7TvfbvmSNRobev5G9zGVn8BESMOWq5p+w/9yKWJmVFJF9gtz8azHO7YFkb6Wb2quIfBqaE90z/G
	/IblAlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqlU-0000000Dwow-1tYK;
	Mon, 20 Oct 2025 14:21:36 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqlR-0000000DwnX-1NnJ
	for ath12k@lists.infradead.org;
	Mon, 20 Oct 2025 14:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760970091; x=1761574891; i=markus.elfring@web.de;
	bh=DFv7GXwF154GDvTPJSyCddEbZ8oE9v2v0Jdmp0obM2Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QKas7CRFMi74WsnHE0VJWeUR6h9mUWf1hUh7EPxPXuo7h6MO9hwFqU/0efN3TLB6
	 1cf9bT+GcTA6qNlKSdwG5rCUZ0xeFbm/2SZegGPZQGEnziEtXdqpHX9WgdgNNFjkE
	 hPUZmKRrwLI1wV+jyZ4Au2Zk98K+TpUgQ49FIwj8muvEJNnQJkb82EdsW2Mu4FxuV
	 VUuHGSKzCPyQSR6PwiDj5kXv9E8dX+YCGuhFhpVAbQGgGoU/N9463lfXaOiZ530VX
	 HJT2euJMQjBFf96s5P6+9Yus7gSmP80V5q4N/JdOVHu3iXlL1PwkPhfuJXfInaLzp
	 D/cTItKHs/w+kZJa0A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YN9-1v8wxH3nUf-00Gmgh; Mon, 20
 Oct 2025 16:21:30 +0200
Message-ID: <f7c1a504-a449-4497-baf2-dcd69486a3fe@web.de>
Date: Mon, 20 Oct 2025 16:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next] wifi: ath12k: Omit a variable reassignment in
 ath12k_ahb_configure_rproc()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gD4DuTDSODYLM/bQWfNxeUBWJw7DfVGQmM4W4KE9Xtm78usFwlS
 PH7cCliyzUuPsc1auK1kG2X1QMtN7ZED+WVzK4V4+EaO+3x3ZkYPmaySThIHhk/XJlu2uu7
 5Sy6JvUuUoIpsCdgrm7OEukJOEFJjy+E6QHu9pBM1QkiFM5zbFyPGNsLXlSslkUMGjmQmDu
 5SjuJNbw6mnqACt6nunIw==
UI-OutboundReport: notjunk:1;M01:P0:0AdiVXWswNw=;Jb6FKwgDOln4SItyGFjqNN3VOOg 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 TQsQA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_072133_648483_8F3C06BE 
X-CRM114-Status: UNSURE (   8.21  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 16:16:34 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete a redundant variable reassignment.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/wireless/ath/ath12k/ahb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/=
ath/ath12k/ahb.c
index b30527c402f6..92079de201a2 100644
=2D-- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -876,8 +876,7 @@ static int ath12k_ahb_configure_rproc(struct ath12k_ba=
se *ab)
=20
 	ret =3D ath12k_ahb_register_rproc_notifier(ab);
 	if (ret < 0) {
-		ret =3D dev_err_probe(&ab->pdev->dev, ret,
-				    "failed to register rproc notifier\n");
+		dev_err_probe(&ab->pdev->dev, ret, "failed to register rproc notifier\n=
");
 		goto err_put_rproc;
 	}
=20
=2D-=20
2.51.1


