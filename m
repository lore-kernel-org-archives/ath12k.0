Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15846606A31C
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3RK8kdkY;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RAwMTGUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvZ+1wYNb7l4gwD0FmPAMuwgxz7ckvcfGr4ESh+a9ro=; b=3RK8kdkYk3fEXmNYPJoB1HEGf4
	PWxPfDbgu7rYSI/MPRyPMv6576fv7bbnv9SQtn4wlqOugbund+0QsIZG3h37CjT7VAvHBxM1pvs1y
	bWpva0zv6AM2286KgUPv1KrpRHYwp+Tpcr6Otc5TalmWSVP7g+DegPckBL2P0bcN31JCW/xPWlm2J
	H6cgx6AALvv+taSCsfHrjc8n/x4HSZx2SxwqGxnWreKYnVEiqoaCktXEzCUhGqsvLn7z5qwMRHMLo
	V4rhZPGXUXI8hSg98Otv0nCIFRM+dcJj9MF8O0Xe4oOCUGJFnlKQdu43xB/8f/4S1UhvfIXfhOkuq
	eClKDoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzSm-00000008fvG-1jTP;
	Tue, 20 Oct 2026 02:20:28 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzSj-00000008fuY-0UHk;
	Tue, 20 Oct 2026 02:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gvZ+1wYNb7l4gwD0FmPAMuwgxz7ckvcfGr4ESh+a9ro=; b=R
	AwMTGUKXIVhjaos7LYXRZcBu7c5VY2rl6hV9jrSyJ34NtR5bVlhhIU+F0zmYjMxR
	sulQcNEf08sd6TfsLQQ1OdWmiuE73dDOkaa7jhHPz5t/ihRXoJ3t+93Mrkvu8k6r
	qc9Sqaq1aU8mTXH7Ui88JkY99XGwCYJ3nGKiMbI0jM=
Date: Tue, 20 Oct 2026 10:19:59 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Jeff Johnson" <jjohnson@kernel.org>,
	"Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>,
	"Sathishkumar Muruganandam" <quic_murugana@quicinc.com>,
	"Anilkumar Kolli" <quic_akolli@quicinc.com>,
	"John Crispin" <john@phrozen.org>, "Kalle Valo" <kvalo@kernel.org>,
	"P Praneesh" <quic_ppranees@quicinc.com>,
	"Balamurugan Selvarajan" <quic_bselvara@quicinc.com>,
	"Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
	"Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Cc: "Jiale Yao" <jiale.yao@example.com>
Subject: Re:[PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261019100029.1908660-1-yaojiale02@163.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAPidvU8i7ymdZukcn08ShO49XMOyvfoi2YFTc98FtwD2/gAgcWZ6I2D88/+uBy+FqSWSfhhg4+5wV5Nyzw8s5Pw1j42aNSXwdx+QjA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgDnt83Qz9ZqVzglAA--.644W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRB4smrWz9C5QQAA3M
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_192025_828128_C23CA231 
X-CRM114-Status: UNSURE (   4.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBwYXRjaCBzZXJpZXMgaXMgc3VwZXJzZWRlZCChqiBwbGVhc2UgaWdub3JlIGl0IGR1ZSB0
byB0aGUgaW5jb3JyZWN0IHNlbmRlciBuYW1lLgpOZXcgb25lIGlzIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNjEwMTkxMDA1MDYuMTkxNTE4MS0xLXlhb2ppYWxlMDJAMTYzLmNvbQpB
dCAyMDI2LTEwLTE5IDE4OjAwOjI1LCAiSmlhbGUgWWFvIiA8eWFvamlhbGUwMkAxNjMuY29tPiB3
cm90ZToKPkZyb206IEppYWxlIFlhbyA8amlhbGUueWFvQGV4YW1wbGUuY29tPgo+Cj5hdGgxMWsg
YW5kIGF0aDEyayBjb25zdW1lIHR3byBmaXJtd2FyZS1wcm92aWRlZCBhcnJheXMgd2l0aG91dCBm
dWxseQo+dmFsaWRhdGluZyB0aGVpciBsZW5ndGhzLiBUaGUgc2VydmljZS1yZWFkeS1leHQgcGFy
c2VyIGFjY2VwdHMgZmV3ZXIKPmV4dGVuZGVkIHJlZ3VsYXRvcnkgY2FwYWJpbGl0eSBlbnRyaWVz
IHRoYW4gdGhlIHNlcGFyYXRlbHkgcmVwb3J0ZWQgUEhZCj5jb3VudCwgd2hpbGUgdGhlIHJlYWR5
LWV2ZW50IHBhcnNlciB0cnVzdHMgdGhlIHJlcG9ydGVkIGV4dHJhIE1BQyBhZGRyZXNzCj5jb3Vu
dCB3aXRob3V0IGNoZWNraW5nIHRoZSBmaXhlZC1zdHJ1Y3R1cmUgYXJyYXkgbGVuZ3RoLgo+Cj5N
YWxmb3JtZWQgZmlybXdhcmUgZGF0YSBjYW4gdGhlcmVmb3JlIG1ha2UgYm90aCBkcml2ZXJzIHJl
YWQgYmV5b25kIHRoZQo+Y29ycmVzcG9uZGluZyBUTFYgYXJyYXlzLiBBZGQgbWF0Y2hpbmcgdmFs
aWRhdGlvbiB0byBlYWNoIGRyaXZlciBiZWZvcmUKPnRoZSBhcnJheXMgYXJlIGluZGV4ZWQuCj4K
PlRoZSBmb3VyIHBhdGNoZXMgYXJlIGluZGVwZW5kZW50IGFuZCBlYWNoIGFkZHJlc3NlcyBvbmUg
cGFyc2luZyBwYXRoIGluCj5vbmUgZHJpdmVyLgo+Cj5KaWFsZSBZYW8gKDQpOgo+ICB3aWZpOiBh
dGgxMWs6IHZhbGlkYXRlIGV4dGVuZGVkIHJlZ3VsYXRvcnkgY2FwYWJpbGl0eSBjb3VudAo+ICB3
aWZpOiBhdGgxMms6IHZhbGlkYXRlIGV4dGVuZGVkIHJlZ3VsYXRvcnkgY2FwYWJpbGl0eSBjb3Vu
dAo+ICB3aWZpOiBhdGgxMWs6IHZhbGlkYXRlIHJlYWR5IGV2ZW50IE1BQyBhZGRyZXNzIGFycmF5
IGxlbmd0aAo+ICB3aWZpOiBhdGgxMms6IHZhbGlkYXRlIHJlYWR5IGV2ZW50IE1BQyBhZGRyZXNz
IGFycmF5IGxlbmd0aAo+Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay93bWkuYyB8
IDEwICsrKysrKysrKysKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL3dtaS5jIHwg
MTAgKysrKysrKysrKwo+IDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4tLSAK
PjIuMzQuMQo=

