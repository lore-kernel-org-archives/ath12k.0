Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53622C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SdubjSHKChqmlsGPN4zoSmO2+nVpgJJfTFATcIe89wA=; b=imWK+eBef9kL18
	6qT5BNkPX3R3KcMoY43V2MuW+R5A8Gu3UvLtvPg2cGKlG07l529MQPE1XOp9l9MXbWAoQgAvP99YH
	HbR0d6dXUrIQhwJ/Lzp8l45rP7VfQHtpgdyfK0bNcUrSiEG+eqs38JPtLSgQ3/I5wZXHfq8/k4Kjs
	bCO8RZTyoFWJ0btI1Pb70cVnC8u0kRElPOGPnM7V85NBYlbe0a7Y24MOtHM9EIyxFO0VisNGY8UTb
	PA3Ek9frgGqVAz0Yei28iayGrnTuCnKMUAPDvtUa6mkMxYCcQ44wW45/nWP3RAu2Oi7pTiYcmRamq
	PxTRZ7cc6VOnDjBhrDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeng-00ATpG-Pn
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 13:59:52 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSend-00ATnX-J4
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 13:59:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cq19so3127340edb.5
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP2EeIZblOgOuyfbYVE/OJExXiFkEYgP2KQobmY9rOA=;
        b=dJ9frDoNz/QXw8Uw3uOyeQTksdlQixz3m/cfPKNF5AV15ylLKUxFNHF0yVswNoyD1L
         ROQA65Qx6LslHdOvsi79R04vxt+cJVEfjPLMF0VKVMNF8VKFElU+n9Ul6jTJ4tuEMFcB
         zcPwsbmRgkxPY49Yqer1SiOR+F9sW03Qgj/y875rQq7BKpXi9mcxj+3S/lzh3Weypbr/
         JM9kJUDpkMVOE/JTaOGdWsbu6wVq4TCGmjw7UqSdG19r6Zn3DvLdwrFCBDnuY+irArJs
         1HV9j0nmcocsEMhFSMs4C82ugE/+Ah5hAFCDRQduomfrVOJqdkhM9lDEtZHF2VjAgdbI
         M9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP2EeIZblOgOuyfbYVE/OJExXiFkEYgP2KQobmY9rOA=;
        b=JDF0w39IYoM2PM6p/tO+JsmCkaHOCNnG+DvYEPa48i1nORD29r/Z909xF/OXTF3B0l
         gNhVOjCsmiGhBBme7xglbLD78ARfSm5Bi1hHkyHHKb7M/DryA/9aX7Svpo8RJbnoDGqk
         tv5eFWZ7NF8kcj7f4l8QBnhjjdgoQAIY10xE0gSC6mVuNfogVGx9QtpAxBvXuN23NCR8
         8wzIBl3eBSgJOyHRUfajuzRIu0OAkXveLdSnXmzQSg7n/gfJE4iYCNswR2IzEt9itRjh
         T2bkJH5wiaiZE8bfGLynYzXSHq/SZa18PgXeMXxGPy1mDmtdX9rsQTPTaBZ4aeEHIHlQ
         lfjA==
X-Gm-Message-State: AO0yUKUHpupcfiACgZuDjAu7lPAV80OB8wJQNPNZKlHaLPOg4TKY9vLT
	9f1wSXFPLcA8zBKaCHCS5DU=
X-Google-Smtp-Source: AK7set9b5QCPv+xCtk2rdKe0+uCgkvalrNzVps3UO97Y7sZj5LraJnILdG9fdQNo1wmXujujqG3sLw==
X-Received: by 2002:a17:907:8a26:b0:8b0:ad0b:7ab8 with SMTP id sc38-20020a1709078a2600b008b0ad0b7ab8mr8219466ejc.14.1676555988312;
        Thu, 16 Feb 2023 05:59:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709064a0500b008b144796d9esm848164eju.143.2023.02.16.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:47 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: memcpy read overflow
Message-ID: <Y+420NRnP8m53bVu@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055949_651126_06490594 
X-CRM114-Status: UNSURE (   7.11  )
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

SGVsbG8gS2FsbGUgVmFsbywKClRoZSBwYXRjaCBkODg5OTEzMjA1Y2Y6ICJ3aWZpOiBhdGgxMms6
IGRyaXZlciBmb3IgUXVhbGNvbW0gV2ktRmkgNwpkZXZpY2VzIiBmcm9tIE5vdiAyOCwgMjAyMiwg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljCmNoZWNrZXIgd2FybmluZzoKCmRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvbWFjLmM6MTYzNiBhdGgxMmtfcGVlcl9hc3Nv
Y19oX2hlKCkgd2FybjogJ2hlX2NhcC0+aGVfY2FwX2VsZW0ubWFjX2NhcF9pbmZvJyBzb21ldGlt
ZXMgdG9vIHNtYWxsICc2JyBzaXplID0gOApkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJr
L21hYy5jOjE2MzggYXRoMTJrX3BlZXJfYXNzb2NfaF9oZSgpIHdhcm46ICdoZV9jYXAtPmhlX2Nh
cF9lbGVtLnBoeV9jYXBfaW5mbycgc29tZXRpbWVzIHRvbyBzbWFsbCAnMTEnIHNpemUgPSAxMgoK
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYwogICAgMTU4NSBzdGF0aWMgdm9p
ZCBhdGgxMmtfcGVlcl9hc3NvY19oX2hlKHN0cnVjdCBhdGgxMmsgKmFyLAogICAgMTU4NiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfdmlmICp2aWYs
CiAgICAxNTg3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGllZWU4
MDIxMV9zdGEgKnN0YSwKICAgIDE1ODggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgYXRoMTJrX3dtaV9wZWVyX2Fzc29jX2FyZyAqYXJnKQogICAgMTU4OSB7CiAgICAx
NTkwICAgICAgICAgY29uc3Qgc3RydWN0IGllZWU4MDIxMV9zdGFfaGVfY2FwICpoZV9jYXAgPSAm
c3RhLT5kZWZsaW5rLmhlX2NhcDsKICAgIDE1OTEgICAgICAgICBpbnQgaTsKICAgIDE1OTIgICAg
ICAgICB1OCBhbXBkdV9mYWN0b3IsIHJ4X21jc184MCwgcnhfbWNzXzE2MCwgbWF4X25zczsKICAg
IDE1OTMgICAgICAgICB1MTYgbWNzXzE2MF9tYXAsIG1jc184MF9tYXA7CiAgICAxNTk0ICAgICAg
ICAgYm9vbCBzdXBwb3J0XzE2MDsKICAgIDE1OTUgICAgICAgICB1MTYgdjsKICAgIDE1OTYgCiAg
ICAxNTk3ICAgICAgICAgaWYgKCFoZV9jYXAtPmhhc19oZSkKICAgIDE1OTggICAgICAgICAgICAg
ICAgIHJldHVybjsKICAgIDE1OTkgCiAgICAxNjAwICAgICAgICAgYXJnLT5oZV9mbGFnID0gdHJ1
ZTsKICAgIDE2MDEgCiAgICAxNjAyICAgICAgICAgc3VwcG9ydF8xNjAgPSAhIShoZV9jYXAtPmhl
X2NhcF9lbGVtLnBoeV9jYXBfaW5mb1swXSAmCiAgICAxNjAzICAgICAgICAgICAgICAgICAgIElF
RUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJRFRIX1NFVF8xNjBNSFpfSU5fNUcpOwogICAg
MTYwNCAKICAgIDE2MDUgICAgICAgICAvKiBTdXBwb3J0ZWQgSEUtTUNTIGFuZCBOU1MgU2V0IG9m
IHBlZXIgaGVfY2FwIGlzIGludGVyc2VjdGlvbiB3aXRoIHNlbGYgaGVfY3AgKi8KICAgIDE2MDYg
ICAgICAgICBtY3NfMTYwX21hcCA9IGxlMTZfdG9fY3B1KGhlX2NhcC0+aGVfbWNzX25zc19zdXBw
LnJ4X21jc18xNjApOwogICAgMTYwNyAgICAgICAgIG1jc184MF9tYXAgPSBsZTE2X3RvX2NwdSho
ZV9jYXAtPmhlX21jc19uc3Nfc3VwcC5yeF9tY3NfODApOwogICAgMTYwOCAKICAgIDE2MDkgICAg
ICAgICBpZiAoc3VwcG9ydF8xNjApIHsKICAgIDE2MTAgICAgICAgICAgICAgICAgIGZvciAoaSA9
IDc7IGkgPj0gMDsgaS0tKSB7CiAgICAxNjExICAgICAgICAgICAgICAgICAgICAgICAgIHU4IG1j
c18xNjAgPSAobWNzXzE2MF9tYXAgPj4gKDIgKiBpKSkgJiAzOwogICAgMTYxMiAKICAgIDE2MTMg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1jc18xNjAgIT0gSUVFRTgwMjExX0hFX01DU19O
T1RfU1VQUE9SVEVEKSB7CiAgICAxNjE0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cnhfbWNzXzE2MCA9IGkgKyAxOwogICAgMTYxNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwogICAgMTYxNiAgICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAxNjE3ICAg
ICAgICAgICAgICAgICB9CiAgICAxNjE4ICAgICAgICAgfQogICAgMTYxOSAKICAgIDE2MjAgICAg
ICAgICBmb3IgKGkgPSA3OyBpID49IDA7IGktLSkgewogICAgMTYyMSAgICAgICAgICAgICAgICAg
dTggbWNzXzgwID0gKG1jc184MF9tYXAgPj4gKDIgKiBpKSkgJiAzOwogICAgMTYyMiAKICAgIDE2
MjMgICAgICAgICAgICAgICAgIGlmIChtY3NfODAgIT0gSUVFRTgwMjExX0hFX01DU19OT1RfU1VQ
UE9SVEVEKSB7CiAgICAxNjI0ICAgICAgICAgICAgICAgICAgICAgICAgIHJ4X21jc184MCA9IGkg
KyAxOwogICAgMTYyNSAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgIDE2MjYgICAg
ICAgICAgICAgICAgIH0KICAgIDE2MjcgICAgICAgICB9CiAgICAxNjI4IAogICAgMTYyOSAgICAg
ICAgIGlmIChzdXBwb3J0XzE2MCkKICAgIDE2MzAgICAgICAgICAgICAgICAgIG1heF9uc3MgPSBt
aW4ocnhfbWNzXzgwLCByeF9tY3NfMTYwKTsKICAgIDE2MzEgICAgICAgICBlbHNlCiAgICAxNjMy
ICAgICAgICAgICAgICAgICBtYXhfbnNzID0gcnhfbWNzXzgwOwogICAgMTYzMyAKICAgIDE2MzQg
ICAgICAgICBhcmctPnBlZXJfbnNzID0gbWluKHN0YS0+ZGVmbGluay5yeF9uc3MsIG1heF9uc3Mp
OwogICAgMTYzNSAKLS0+IDE2MzYgICAgICAgICBtZW1jcHkoJmFyZy0+cGVlcl9oZV9jYXBfbWFj
aW5mbywgaGVfY2FwLT5oZV9jYXBfZWxlbS5tYWNfY2FwX2luZm8sCiAgICAxNjM3ICAgICAgICAg
ICAgICAgIHNpemVvZihhcmctPnBlZXJfaGVfY2FwX21hY2luZm8pKTsKClRoZXNlIGJ1ZmZlcnMg
YXJlIGRpZmZlcmVudCBzaXplcy4gIEkgd291bGQgYmUgc3VycHJpc2VkIGlmIENsYW5nCmNvbXBp
bGVzIHRoaXMuICBLZWVzIGhhcyBiZWVuIHRyeWluZyB0byBhZGRyZXNzIHRoaXMgc29ydCBvZiB0
aGluZy4KCiAgICAxNjM4ICAgICAgICAgbWVtY3B5KCZhcmctPnBlZXJfaGVfY2FwX3BoeWluZm8s
IGhlX2NhcC0+aGVfY2FwX2VsZW0ucGh5X2NhcF9pbmZvLAogICAgMTYzOSAgICAgICAgICAgICAg
ICBzaXplb2YoYXJnLT5wZWVyX2hlX2NhcF9waHlpbmZvKSk7CgpTYW1lLgoKICAgIDE2NDAgICAg
ICAgICBhcmctPnBlZXJfaGVfb3BzID0gdmlmLT5ic3NfY29uZi5oZV9vcGVyLnBhcmFtczsKICAg
IDE2NDEgCiAgICAxNjQyICAgICAgICAgLyogdGhlIHRvcCBtb3N0IGJ5dGUgaXMgdXNlZCB0byBp
bmRpY2F0ZSBCU1MgY29sb3IgaW5mbyAqLwogICAgMTY0MyAgICAgICAgIGFyZy0+cGVlcl9oZV9v
cHMgJj0gMHhmZmZmZmY7CiAgICAxNjQ0IAogICAgMTY0NSAgICAgICAgIC8qIEFzIHBlciBzZWN0
aW9uIDI2LjYuMSBJRUVFIFN0ZCA4MDIuMTFheOKAkDIwMjIsIGlmIHRoZSBNYXggQU1QRFUKICAg
IDE2NDYgICAgICAgICAgKiBFeHBvbmVudCBFeHRlbnNpb24gaW4gSEUgY2FwIGlzIHplcm8sIHVz
ZSB0aGUgYXJnLT5wZWVyX21heF9tcGR1CiAgIApyZWdhcmRzLApkYW4gY2FycGVudGVyCgotLSAK
YXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
