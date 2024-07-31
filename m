Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8CBC3DA64
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R+bv4Bwu1I6f4ECTie6v+7M1Uib0OR3KDAcl9yHu+c=; b=yov2b6rpLggImgzEgTahxjD8e1
	N2YlD/pjRiCxZsYQzxM4Gzvxqk8RuUR3sUhhOt8KTZNBRVxj9jGPTXRvzYvReC0hQ3pQkmsjqlzky
	nyLIT8cIBfqOy2rWJdBq73mOTGpNx6zfqZKPRDjsLH+TrExR2o8hgJIA0iJ0unqzQ7Q7ifYybdgcm
	JK1W0IiLi/u/z4TRncP1hmkJkvXWZ51/llRhgUPhI9KZprytWqQAao4LMzmTf6AtD39PvJ1oME+NZ
	95cmJo73fOC5EysJCOxKJDx95Ts5v5BquA23kPfJ60uRb3D37zdYm4hAqocLQUhmdfVO5c3b1e2jk
	O+5bZFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBvT-00000001p9t-37fk
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 16:11:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBvP-00000001p9G-404l
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 16:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4CF8CE16F2;
	Wed, 31 Jul 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EACC116B1;
	Wed, 31 Jul 2024 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722442297;
	bh=1eKOkGjX0nFNC5avzkXBDNqXKPdl5YaN3pMfAZOvbu4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Xhs/6iw3rUTCZklPVVfWH7tG9HQVL2N/AIBswSh1zdmI8+jQwBlcJuu4YAT2A05Ut
	 mNDDAn7d1suSVo+kguhkmPe+h24QCdW3DudRLjBPdLTZhmLAHf+42aRDBtM+g1p4+R
	 sJSgY8a17+3HyEikthfhTYKfWwDPZuQ60uk9+o+Diff0h4/h3j0W+axnrNcT7J3eRI
	 N0snGnj42wdcPN+NIcQ2GjKXIB2vHLNuBdQTjQXwDdhtS+Gkz69Lxkgmc0+92T1rqq
	 8MmmWPDRWbreZJAMFXLQxwHbdotXNYs687dd5/m5c2lAQbHnUHVi//jKssERWIZrdV
	 Rc/xWMV3JVQbA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Paolo Abeni <pabeni@redhat.com>,  <netdev@vger.kernel.org>,  Jeff
 Johnson <jjohnson@kernel.org>,  "Baochen Qiang" <quic_bqiang@quicinc.com>,
  <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>,  Jakub
 Kicinski <kuba@kernel.org>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net] wifi: ath12k: fix build vs old compiler
References: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
	<69825f6e-c981-4f02-b10f-27e0799804e1@quicinc.com>
Date: Wed, 31 Jul 2024 19:11:33 +0300
In-Reply-To: <69825f6e-c981-4f02-b10f-27e0799804e1@quicinc.com> (Jeff
	Johnson's message of "Tue, 16 Jul 2024 07:40:57 -0700")
Message-ID: <87v80l8rt6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_091140_376940_CEA25BA5 
X-CRM114-Status: UNSURE (   9.91  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/16/2024 4:06 AM, Paolo Abeni wrote:
>
>> gcc 11.4.1-3 warns about memcpy() with overlapping pointers:
>>=20
>> drivers/net/wireless/ath/ath12k/wow.c: In function
>> =E2=80=98ath12k_wow_convert_8023_to_80211.constprop=E2=80=99:
>> ./include/linux/fortify-string.h:114:33: error: =E2=80=98__builtin_memcp=
y=E2=80=99
>> accessing 18446744073709551611 or more bytes at offsets 0 and 0
>> overlaps 9223372036854775799 bytes at offset -9223372036854775804
>> [-Werror=3Drestrict]
>>   114 | #define __underlying_memcpy     __builtin_memcpy
>>       |                                 ^
>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro
>> =E2=80=98__underlying_memcpy=E2=80=99
>>   637 |         __underlying_##op(p, q, __fortify_size);                =
        \
>>       |         ^~~~~~~~~~~~~
>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro
>> =E2=80=98__fortify_memcpy_chk=E2=80=99
>>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
>>       |                          ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macr=
o =E2=80=98memcpy=E2=80=99
>>   190 |                         memcpy(pat, eth_pat, eth_pat_len);
>>       |                         ^~~~~~
>> ./include/linux/fortify-string.h:114:33: error: =E2=80=98__builtin_memcp=
y=E2=80=99
>> accessing 18446744073709551605 or more bytes at offsets 0 and 0
>> overlaps 9223372036854775787 bytes at offset -9223372036854775798
>> [-Werror=3Drestrict]
>>   114 | #define __underlying_memcpy     __builtin_memcpy
>>       |                                 ^
>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro
>> =E2=80=98__underlying_memcpy=E2=80=99
>>   637 |         __underlying_##op(p, q, __fortify_size);                =
        \
>>       |         ^~~~~~~~~~~~~
>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro
>> =E2=80=98__fortify_memcpy_chk=E2=80=99
>>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
>>       |                          ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macr=
o =E2=80=98memcpy=E2=80=99
>>   232 |                         memcpy(pat, eth_pat, eth_pat_len);
>>       |                         ^~~~~~
>>=20
>> The sum of size_t operands can overflow SIZE_MAX, triggering the
>> warning.
>> Address the issue using the suitable helper.
>>=20
>> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>> Only built tested. Sending directly to net to reduce the RTT, but no
>> objections to go through the WiFi tree first
>
> Since Kalle is on holiday please go ahead and take this via net.
> This looks nicer than Kalle's version :)

Indeed, this is nicer. Thanks Paolo!

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

