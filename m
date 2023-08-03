Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8772EB64DD
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAYsWf61CtsKIduvcH70WaAr25rnYFXDF6eZKyvMnnw=; b=1rCmF66x/sqPgt
	sQnTQFNy3R7ID2Lk9T7XqH6o7QWTB2lZazeTSnJ6oaAZXwnOwaVH5oaCDDN8m2QxH4EX3pZxdZ98N
	1HsQvM75rbzzuJ3fCSlNxcUuWIvF11n7O71cnyjRYtZgW6cJHKO0u/QRB8a3Fp+woweI8gKrSYyok
	uRU1KfQR5XzzMQHKQZC2TPethyu5F6F1id0EIzSZgV+twAp7ZYzmIA+auvAD/ooSekXLV85p/xZe2
	nYzqS4zheZBF3667AlWRmmwm1EpF5kAkSiqB31XgmHl+TYEtzp/ZqvcJ3qMIm+U1scOgYpU0LF4RP
	xsgWZB1fJbO9mZkDzZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYmG-009Hjp-1v
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 13:54:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYmD-009Hgh-0K
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 13:54:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64FED61DAB;
	Thu,  3 Aug 2023 13:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02E8C433C9;
	Thu,  3 Aug 2023 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691070843;
	bh=2zndGpTW3ZG0uaaqaVtbSxN+xzTy4HQzh1W7lEh+UII=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eljg5XsEByTElk9FWxj66hON4KRf6wEx9aq3ngYXSAXGcf2vNMayxyi6a/SHGOcdC
	 a8m7uupwp3lOjgnQWZdfVH3cKYA/ywYFURVYOzEcBOkWGwVrVxM/WjuZ585h/so7IB
	 9Ne+6Kfw1beI3wJndMEJ5qIHEOod3JlT9GuICdZBMEs/000Xq15Q2WwpEPYpejEICg
	 Kimp8m4jHbFGYqtoN+7f9aY5VYzHH338g4XQfoQfcGLK7jPzPCNXcJvYDS++UBh+Cm
	 zYb+K4+++6gec3sqhlYvg9Zinj2r/huvzJqN56M/W3wdfI71FCpp8T8ME4JrLxHdtx
	 nowha7IAQeFmQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: ath12k: memcpy() source buffer overread
References: <5c114ed7-6e8a-76a7-c0da-4193d1288686@yandex.ru>
Date: Thu, 03 Aug 2023 16:54:00 +0300
In-Reply-To: <5c114ed7-6e8a-76a7-c0da-4193d1288686@yandex.ru> (Dmitry
	Antipov's message of "Tue, 20 Jun 2023 09:18:03 +0300")
Message-ID: <875y5wteo7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_065405_262996_D9150A0E 
X-CRM114-Status: GOOD (  10.26  )
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

KyBhdGgxMmsgbGlzdAoKRG1pdHJ5IEFudGlwb3YgPGRtYW50aXBvdkB5YW5kZXgucnU+IHdyaXRl
czoKCj4gV2hlbiBjb21waWxpbmcgd2l0aCBnY2MgMTMuMSBhbmQgQ09ORklHX0ZPUlRJRllfU09V
UkNFPXksIEkndmUgbm90aWNlZCB0aGUgZm9sbG93aW5nOgo+Cj4gLi4uCj4gSW4gZnVuY3Rpb24g
4oCYZm9ydGlmeV9tZW1jcHlfY2hr4oCZLAo+ICAgICBpbmxpbmVkIGZyb20g4oCYYXRoMTJrX3Bl
ZXJfYXNzb2NfaF9oZeKAmSBhdCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5j
OjE2NDA6MiwKPiAgICAgaW5saW5lZCBmcm9tIOKAmGF0aDEya19wZWVyX2Fzc29jX3ByZXBhcmXi
gJkgYXQgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYzoyMDI3OjI6Cj4gLi9p
bmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6NTI5OjI1OiB3YXJuaW5nOiBjYWxsIHRvIOKA
mF9fcmVhZF9vdmVyZmxvdzJfZmllbGTigJkgZGVjbGFyZWQgd2l0aAo+IGF0dHJpYnV0ZSB3YXJu
aW5nOiBkZXRlY3RlZCByZWFkIGJleW9uZCBzaXplIG9mIGZpZWxkICgybmQgcGFyYW1ldGVyKTsg
bWF5YmUgdXNlIHN0cnVjdF9ncm91cCgpPwo+IFstV2F0dHJpYnV0ZS13YXJuaW5nXQo+ICAgNTI5
IHwgICAgICAgICAgICAgICAgICAgICAgICAgX19yZWFkX292ZXJmbG93Ml9maWVsZChxX3NpemVf
ZmllbGQsIHNpemUpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gSW4gZnVuY3Rpb24g4oCYZm9ydGlm
eV9tZW1jcHlfY2hr4oCZLAo+ICAgICBpbmxpbmVkIGZyb20g4oCYYXRoMTJrX3BlZXJfYXNzb2Nf
aF9oZeKAmSBhdCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jOjE2NDM6MiwK
PiAgICAgaW5saW5lZCBmcm9tIOKAmGF0aDEya19wZWVyX2Fzc29jX3ByZXBhcmXigJkgYXQgZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYzoyMDI3OjI6Cj4gLi9pbmNsdWRlL2xp
bnV4L2ZvcnRpZnktc3RyaW5nLmg6NTI5OjI1OiB3YXJuaW5nOiBjYWxsIHRvIOKAmF9fcmVhZF9v
dmVyZmxvdzJfZmllbGTigJkgZGVjbGFyZWQgd2l0aAo+IGF0dHJpYnV0ZSB3YXJuaW5nOiBkZXRl
Y3RlZCByZWFkIGJleW9uZCBzaXplIG9mIGZpZWxkICgybmQgcGFyYW1ldGVyKTsgbWF5YmUgdXNl
IHN0cnVjdF9ncm91cCgpPwo+IFstV2F0dHJpYnV0ZS13YXJuaW5nXQo+ICAgNTI5IHwgICAgICAg
ICAgICAgICAgICAgICAgICAgX19yZWFkX292ZXJmbG93Ml9maWVsZChxX3NpemVfZmllbGQsIHNp
emUpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gLi4uCj4KPiBBbmQgdGhpcyBzZWVtcyBjb3JyZWN0
IGJlY2F1c2U6Cj4KPiAvKiBkc3Q6IHUzMlsyXSwgc3JjOiB1OFs2XSwgc2l6ZTogOCBzbyAyIGJ5
dGUgc291cmNlIG92ZXJyZWFkICovCj4gbWVtY3B5KCZhcmctPnBlZXJfaGVfY2FwX21hY2luZm8s
IGhlX2NhcC0+aGVfY2FwX2VsZW0ubWFjX2NhcF9pbmZvLAo+ICAgICAgICBzaXplb2YoYXJnLT5w
ZWVyX2hlX2NhcF9tYWNpbmZvKSk7Cj4KPiBhbmQ6Cj4KPiAvKiBkc3Q6IHUzMlszXSwgc3JjOiB1
OFsxMV0sIHNpemU6IDEyIHNvIDEgYnl0ZSBzb3VyY2Ugb3ZlcnJlYWQgKi8KPiBtZW1jcHkoJmFy
Zy0+cGVlcl9oZV9jYXBfcGh5aW5mbywgaGVfY2FwLT5oZV9jYXBfZWxlbS5waHlfY2FwX2luZm8s
Cj4gICAgICAgIHNpemVvZihhcmctPnBlZXJfaGVfY2FwX3BoeWluZm8pKTsKCkFybmQgZml4ZWQg
dGhpczoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcva3ZhbG8vYXRoL2MvNjAzY2Y2YzJmY2RjCgot
LSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xp
c3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3Vt
ZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEy
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEyawo=
