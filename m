Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A5CC636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sr3acK5Xm+RGK6IBO+7Nme7R6P8W9y03GBbNq6zcV8k=; b=T3iRT9jDaJwNKk
	Zhg/v2GhdKTSA7QjLhuTL2y9jCbTfGl+YxH+9WK5kKBbzHWbGIyzadQkrW/JwOljln0V1yTyCyofp
	Cj++ms8Z6GEEX/AYjrjukcUia6xHcGLmIs8W3b6DQ51CoxuPSJXUyl5uZ2iNabxPtP1dsvsSzDY29
	HPm0lpeLzoF1kbvNEVAfvIUZ4sLS+7jcJnVZKl8gjyt699GUaJYfn2znkYU3Ky67qBIrd+X5Fmvqo
	hUL592KnB9oJEStRRSatrzB4N9WlouhkEM/mZVItQJfENe/sXLAyvEya1i5WEyAo+2McPI+pAZryg
	epO90Na7Tb618341GPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScgT-00A06R-5W
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 11:44:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScgQ-00A04j-RH
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 11:44:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cq19so2394121edb.5
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS0XvFFSocknnXxg2MZxERDvc2AIOpfeFuBn5T6WGLE=;
        b=f8nPpSWA/togbcCWFyXQdJrFR3L4UpzsO2lQhEqNLjqbwgfDROfoZMUpBoDVDvBatN
         PLiosw0BxHg6dZ1VnX4Pw7CSQMSWTnbjmuKERI0UQHCd1apx1yFj8si8LU6lJo8H4pa+
         s9HwzFYC2MZ/+y7q14K343cBiT54l8mWQzjmmkPKu33eS6CEIMPoMniz6kX8Rlam8yzL
         MouAr4mbb52x+w+m3/4VSZ6xCt3jldLwryS+xNcyo85FN0/wqiieJr1ypker+EkdNQ1r
         OCJutiliDfMrmClsFHzqmZGNa/8bK6hGuv2rkRsB8PMn4v9xcB+ZvNJougSomkuhkSu1
         l8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS0XvFFSocknnXxg2MZxERDvc2AIOpfeFuBn5T6WGLE=;
        b=k7NT8vNyGIQJw/GgFN7sCmxpgJh25PC9QocNnfZeQDg8eaFlLhv50lQeFBWAqio0/3
         RjSPC27kJgL+wFq6nLARxE1WEsG4gPjxYuHCsYlrpHGx2vZVFQZeiuhv3mYnTmjF4efV
         MQWCjJ8oQO1oi3XGq3rYv+arLJVstUi6u0t82YY3ewm0368dySeajZCbM57dByX5hmw2
         bpNN6sqp54gJFvVq3i7NXcB5OKl/vl/gZM2H9ngFH8KQM5E0pu3YAzzaaWBjTYjJF/iF
         fRwJXH82VjvageoehR6QHY6F6yNl++jBuE+0gflQl6yQCjkhKyp1RpcIzFN+CUyVGNGE
         SDmA==
X-Gm-Message-State: AO0yUKV8xrHceP7262CxFiJQBrG7bfPXoOtB0B1Vn9tQd+1XZMsRAZ1C
	7y2goaDAQGFyFCbJjXs7JSNXs2IAx2Y=
X-Google-Smtp-Source: AK7set/vVTleZ59V6pnITF7gpJZpUkpEgzciyibSnS/+w65yk8GoXzHMaSb+o/8N6qs8TnDDxfsX5A==
X-Received: by 2002:aa7:d307:0:b0:4ac:bd84:43e1 with SMTP id p7-20020aa7d307000000b004acbd8443e1mr5237023edq.8.1676547850233;
        Thu, 16 Feb 2023 03:44:10 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a65-20020a509ec7000000b004acc5077026sm728891edf.79.2023.02.16.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:44:09 -0800 (PST)
Date: Thu, 16 Feb 2023 14:44:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <Y+4XAnViIEiHzFXw@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_034414_907553_6F62276B 
X-CRM114-Status: UNSURE (   7.01  )
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
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljCmNoZWNrZXIgd2FybmluZzoKCglk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jOjE2NTggYXRoMTJrX3BlZXJfYXNz
b2NfaF9oZSgpCgl3YXJuOiBtYXNrIGFuZCBzaGlmdCB0byB6ZXJvCgpkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTJrL21hYy5jCiAgICAxNjQyICAgICAgICAgLyogdGhlIHRvcCBtb3N0IGJ5
dGUgaXMgdXNlZCB0byBpbmRpY2F0ZSBCU1MgY29sb3IgaW5mbyAqLwogICAgMTY0MyAgICAgICAg
IGFyZy0+cGVlcl9oZV9vcHMgJj0gMHhmZmZmZmY7CiAgICAxNjQ0IAogICAgMTY0NSAgICAgICAg
IC8qIEFzIHBlciBzZWN0aW9uIDI2LjYuMSBJRUVFIFN0ZCA4MDIuMTFheOKAkDIwMjIsIGlmIHRo
ZSBNYXggQU1QRFUKICAgIDE2NDYgICAgICAgICAgKiBFeHBvbmVudCBFeHRlbnNpb24gaW4gSEUg
Y2FwIGlzIHplcm8sIHVzZSB0aGUgYXJnLT5wZWVyX21heF9tcGR1CiAgICAxNjQ3ICAgICAgICAg
ICogYXMgY2FsY3VsYXRlZCB3aGlsZSBwYXJzaW5nIFZIVCBjYXBzKGlmIFZIVCBjYXBzIGlzIHBy
ZXNlbnQpCiAgICAxNjQ4ICAgICAgICAgICogb3IgSFQgY2FwcyAoaWYgVkhUIGNhcHMgaXMgbm90
IHByZXNlbnQpLgogICAgMTY0OSAgICAgICAgICAqCiAgICAxNjUwICAgICAgICAgICogRm9yIG5v
bi16ZXJvIHZhbHVlIG9mIE1heCBBTVBEVSBFeHBvbmVudCBFeHRlbnNpb24gaW4gSEUgTUFDIGNh
cHMsCiAgICAxNjUxICAgICAgICAgICogaWYgYSBIRSBTVEEgc2VuZHMgVkhUIGNhcCBhbmQgSEUg
Y2FwIElFIGluIGFzc29jIHJlcXVlc3QgdGhlbiwgdXNlCiAgICAxNjUyICAgICAgICAgICogTUFY
X0FNUERVX0xFTl9GQUNUT1IgYXMgMjAgdG8gY2FsY3VsYXRlIG1heF9hbXBkdSBsZW5ndGguCiAg
ICAxNjUzICAgICAgICAgICogSWYgYSBIRSBTVEEgdGhhdCBkb2VzIG5vdCBzZW5kIFZIVCBjYXAs
IGJ1dCBIRSBhbmQgSFQgY2FwIGluIGFzc29jCiAgICAxNjU0ICAgICAgICAgICogcmVxdWVzdCwg
dGhlbiB1c2UgTUFYX0FNUERVX0xFTl9GQUNUT1IgYXMgMTYgdG8gY2FsY3VsYXRlIG1heF9hbXBk
dQogICAgMTY1NSAgICAgICAgICAqIGxlbmd0aC4KICAgIDE2NTYgICAgICAgICAgKi8KICAgIDE2
NTcgICAgICAgICBhbXBkdV9mYWN0b3IgPSAoaGVfY2FwLT5oZV9jYXBfZWxlbS5tYWNfY2FwX2lu
Zm9bM10gJgotLT4gMTY1OCAgICAgICAgICAgICAgICAgICAgICAgICBJRUVFODAyMTFfSEVfTUFD
X0NBUDNfTUFYX0FNUERVX0xFTl9FWFBfTUFTSykgPj4KICAgIDE2NTkgICAgICAgICAgICAgICAg
ICAgICAgICAgSUVFRTgwMjExX0hFX01BQ19DQVAzX01BWF9BTVBEVV9MRU5fRVhQX01BU0s7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eXl5eClRoaXMgbGlrZWx5IHNob3VsZCBiZSBzaGlmdGluZyBieSBhIHNo
aWZ0IGRlZmluZSBpbnN0ZWFkIG9mIGEgX01BU0sKdmFsdWUuCgogICAgMTY2MCAKICAgIDE2NjEg
ICAgICAgICBpZiAoYW1wZHVfZmFjdG9yKSB7CiAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXgoKTmV2ZXIgZ29pbmcgdG8gYmUgdHJ1ZS4KCiAgICAxNjYyICAgICAgICAgICAgICAgICBp
ZiAoc3RhLT5kZWZsaW5rLnZodF9jYXAudmh0X3N1cHBvcnRlZCkKICAgIDE2NjMgICAgICAgICAg
ICAgICAgICAgICAgICAgYXJnLT5wZWVyX21heF9tcGR1ID0gKDEgPDwgKElFRUU4MDIxMV9IRV9W
SFRfTUFYX0FNUERVX0ZBQ1RPUiArCiAgICAxNjY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBhbXBkdV9mYWN0b3IpKSAtIDE7CiAgICAxNjY1ICAg
ICAgICAgICAgICAgICBlbHNlIGlmIChzdGEtPmRlZmxpbmsuaHRfY2FwLmh0X3N1cHBvcnRlZCkK
ICAgIDE2NjYgICAgICAgICAgICAgICAgICAgICAgICAgYXJnLT5wZWVyX21heF9tcGR1ID0gKDEg
PDwgKElFRUU4MDIxMV9IRV9IVF9NQVhfQU1QRFVfRkFDVE9SICsKICAgIDE2NjcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtcGR1X2ZhY3Rvcikp
IC0gMTsKICAgIDE2NjggICAgICAgICB9CiAgICAxNjY5IAoKcmVnYXJkcywKZGFuIGNhcnBlbnRl
cgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
