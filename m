Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61193C4167D
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFvyV7e1bzz7gD4KYsTbPrLgMEHEHHOgPcotDwCj9fU=; b=Xz0wLnbkWRZxDc
	RWM2nuItrpZpn6C+3DTl3h3k1b4IqarjcJxrdi/UyhrgPApLksXKH1O7DmmrK8PED96lZjU7zWp+3
	Cp+6Guaxki5KvauwLcE5bdSY8cQsdEZT9LXZM20LLam++4E1VH2WA+XuJgx8rJx2BZJOl2OJo7NT0
	SgRJa9fu3W2VNDTEy6VA1nCHqf9E2eyAQbwRMClxjZYjCyrEIdGbxBGNzbK/2MmQYLCXF8B/uAkw+
	fZ/yTx6/nFfCADtkI6h553aIpoNM4oMWhdo9ATGtZXEvYv7LSXtky17m2N+JgIcatYPAoNRrGp74r
	6DhW2lEme6HE94YinoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSI-005ygV-Qw
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSH-005yfP-3Y
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D2Tgb79Kc3nNZyKuSF62YgVI12/uAG074tkpquZByB0=; b=qoldmP22yupe+wnGOjbGvBX8zC
	x3zftViwsopIE4tvOCWiB7O+NJPZPX5KCsIYVS7kLLKgGwwtaoXErcGVMHBy2TBvfU/6NcIUaCm2M
	MdGDgjYDpxgSZ7H/71SGC1yngW8EfGDxi9ornzrk4VjuwcAYIjM8zqEZk3U3ICReehUquMzuN/fqi
	5ly0y5HYMR9N5gPd9yoxSlHn0hWRc0EdxLhbv7p8tXSty2TpYvIA0HjjGUqGfrM1cR0m2MUAAmeKI
	kdlibV5AR/hrBFQ2srHo/73MkK3jN+RMOTNv+GyQKDBn7gGJpHJ3ZalqfGsur69s5WsotZeFq2oOA
	KLcndt8g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSC-001P3b-Qf
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 908D361EF6
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50EFC433D6;
	Wed, 16 Nov 2022 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616800;
	bh=BEx0VdeZ1XIdZPpAz33Ip1VWpLLqTaOVhzeD8qXteLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VqnYtuLZPph4MIVY9jkDAkjNyVrjdPj0Bw7TsRww8Wkk3GCkKw+XcKI70wmNvMTVA
	 9gVSYbGN60KnuPzH2ZkZ2tYJkvDwyzxtRuxlC6eSUSWa/OHZmSh+jMNOW/79GWw8tD
	 dSmYr+05ClK2mKwIx8wpra7U24kPottpAiRcJXjxqWoQ4TiIEP7xsmNntV6Hpx+MXw
	 1qrtr2jLvFPYRAp0aJKBZgP9nNItAhG62Si0AVaOVF3CLXUchyqOpE+pixUKh27I1I
	 /ndhZZedTYTXz7wyTEo1rBkP19pMR7s8lTiSrpVsCsOBwtV8MUJxO4nS6BFPf2UAeI
	 V5LduFLPxtAaQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 50/50] MAINTAINERS: add ath12k
Date: Wed, 16 Nov 2022 18:39:02 +0200
Message-Id: <20221116163902.24996-51-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_164001_025371_E92D469F 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

RnJvbTogS2FsbGUgVmFsbyA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KCkFkZCBhbiBlbnRyeSBm
b3IgYXRoMTJrIHRvIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgoKU2lnbmVkLW9mZi1ieTogS2FsbGUg
VmFsbyA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNjY3MzhjODMzMGRiLi45OGQ3YjViYTA1OGIgMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNjU3MSw2ICsxNjU3MSwx
MyBAQCBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2t2YWxvL2F0aC5naXQKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
d2lyZWxlc3MvcWNvbSxhdGgxMWsueWFtbAogRjoJZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay8KIAorUVVBTENPTU0gQVRIMTJLIFdJUkVMRVNTIERSSVZFUgorTToJS2FsbGUgVmFsbyA8
a3ZhbG9Aa2VybmVsLm9yZz4KK0w6CWF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCitTOglTdXBw
b3J0ZWQKK1Q6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQva3ZhbG8vYXRoLmdpdAorRjoJZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay8KKwog
UVVBTENPTU0gQVRIRVJPUyBBVEg5SyBXSVJFTEVTUyBEUklWRVIKIE06CVRva2UgSMO4aWxhbmQt
SsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgogTDoJbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwu
b3JnCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
