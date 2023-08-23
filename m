Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2317BEE49B0
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTZN7O1MtmManwuZT4yELH7gLBjBLkB6LZluBSVLLiE=; b=gvHzJBVzvZT2AJ
	M3aIrxHxH3AajGB8sYrAPVFYaIiWfM8qPaqlN9C/GvY7Cc00gbn1UP5ONndvtEGc0rEb/ViQMG2Ix
	F1/zt/bpQmWMSBNd3xrV8Ed1hUF7sbKqVKyMD8Av/61iQH3L5eSChZ/iaLsPqQHh5NNOv1J3v7IVf
	bwfi+8LtwaFate+X8DDt3RvWeuMGo6qpJaayCsPAtI9xlUVI8qyPX8egFllay+O/2xgLIW+kvNEQS
	8ElzpZw/1SqNnHzsKp6Wi4iIiKfZbbPMx0uvMveSX7HN7qvH7FzHX2Kv9UVCalL+NacrLnjk4YwY9
	yvtvSyMJCY1Ke1X+y+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYob2-000ovi-2h
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 14:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYob0-000ov6-1h
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 14:12:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F17E8626F8;
	Wed, 23 Aug 2023 14:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC8EC433C8;
	Wed, 23 Aug 2023 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799949;
	bh=aK8sjaMMZCwX9NyCciICkzG/hN1SXAT3vqzO/pjFLfU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Wy3UBr+NXNWEJ0EK7Z7zSFIDDpS79KrygtZ/M2QrDWykNrZLB+nC9TuIzBKj4M8zd
	 5F65MB/Z0zUhZ9oKfA9Q3KY4flQE9A8KrD9MkMU33jMOwLkYcv5kNiYlCDZbUbv4Kb
	 2ZbBV9iSvOMAmq6xk52O2Y/0R5luCW1sTkzQ/k0ouQ5P9weP9OODRuMCcEHcEgZDay
	 OIK7YO++zXlzbsGUZRnglE8CIUGRkmGqCl1i5wGwnqnsYCcV2fLI46KNlS1m9LrfJj
	 JFH45QVbUGqx6BPARaJw7K3a43L1itv8zwQ+6XAHsnH4Bp/KTX0n18o4zlkiQndEe8
	 vTbCdSNWmP59g==
MIME-Version: 1.0
Subject: Re: [PATCH] wireless: ath: remove unused-but-set parameter
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230814073255.1065242-1-arnd@kernel.org>
References: <20230814073255.1065242-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Jiri Slaby <jirislaby@kernel.org>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rg?=
	=?utf-8?q?ensen?= <toke@toke.dk>, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Aloka Dixit <quic_alokad@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
 Karthik M <quic_karm@quicinc.com>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Muna Sinada <quic_msinada@quicinc.com>,
 Johannes Berg <johannes.berg@intel.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279994309.1241462.4902060190559349249.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:12:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_071230_626375_D0D84738 
X-CRM114-Status: UNSURE (   7.71  )
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

QXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhpcyBoYXMgbmV2ZXIg
YmVlbiB1c2VkIHNpbmNlIHRoZSBkcml2ZXIgd2FzIG1lcmdlZCwgYnV0IGl0IG5vdyBjYXVzZXMK
PiBhIFc9MSB3YXJuaW5nIGluIHJlY2VudCBjbGFuZyB2ZXJzaW9ucwo+IAo+IGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGg5ay9tYWluLmM6MTU2NjoyMTogZXJyb3I6IHBhcmFtZXRlciAnY2hh
bmdlZF9mbGFncycgc2V0IGJ1dCBub3QgdXNlZCBbLVdlcnJvciwtV3VudXNlZC1idXQtc2V0LXBh
cmFtZXRlcl0KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoOWsvaHRjX2Rydl9tYWluLmM6
MTI1ODoyNTogZXJyb3I6IHBhcmFtZXRlciAnY2hhbmdlZF9mbGFncycgc2V0IGJ1dCBub3QgdXNl
ZCBbLVdlcnJvciwtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlcl0KPiBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoNWsvbWFjODAyMTEtb3BzLmM6MzY3OjYyOiBlcnJvcjogcGFyYW1ldGVyICdj
aGFuZ2VkX2ZsYWdzJyBzZXQgYnV0IG5vdCB1c2VkIFstV2Vycm9yLC1XdW51c2VkLWJ1dC1zZXQt
cGFyYW1ldGVyXQo+IAo+IFJlbW92ZSB0aGUgYml0IG1hbmlwdWxhdGlvbiBvbiB0aGUgb3RoZXJ3
aXNlIHVudXNlZCBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPiBSZXZpZXdlZC1ieTogSmVmZiBKb2huc29uIDxxdWljX2pqb2huc29u
QHF1aWNpbmMuY29tPgo+IEFja2VkLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VA
dG9rZS5kaz4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMu
Y29tPgoKUGF0Y2ggYXBwbGllZCB0byBhdGgtbmV4dCBicmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtz
LgoKM2I4NmY4NmQwZjE2IHdpZmk6IGF0aDogcmVtb3ZlIHVudXNlZC1idXQtc2V0IHBhcmFtZXRl
cgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVz
cy9wYXRjaC8yMDIzMDgxNDA3MzI1NS4xMDY1MjQyLTEtYXJuZEBrZXJuZWwub3JnLwoKaHR0cHM6
Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1
Ym1pdHRpbmdwYXRjaGVzCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTJrCg==
