Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF8DC78849
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvjlqez9dWjFUgfULfHR5SvMXAjHcibIE6lMpBVpUjw=; b=W6qu6x/6NzWcHK8+4dqS3Qwmoy
	LMqQW7upFkNDtQHkZojEnTLPp5W3LpEtw5+HRXpwQ9xHDRV4QrFQa97rmyeQkupA3CG3KuvXJmYKS
	TYE0KCMTrDNcSbNCuLAETDaTqSvRwUUYjy2Himtg3+IPuFjWSdk4O4ML7lmOF7zmUjoHNBhh5Ulbz
	lV8mwuOyOpKhQ+e2lOdkKZne43KvrZmXrKSqli/ru2YyURxRnSu7nCRB61NUB2h2Q9Lz+dBNrZvQh
	a2YREcltwslvBIOS3xu3oeTkKTINBlXbKLUpzdU8B2IPwo1RwnU3IpvFa6CmzoissCQFWJEBwQz5j
	Xfo3sFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdtP-0000000CHYy-0W7L
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 13:41:51 +0000
Received: from mail36c25.carrierzone.com ([64.29.147.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdtC-0000000CHVc-1E38
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 13:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1726839696;
	bh=VNyUJu6k3VnnIvnt9gW/+k4KpjjWXajxFGy2I2TqVKo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=vYsLL0oijl0/8Bj3XkA8D0RTDnlv/SeIOCxlG15WR4omO+mZFJFr9cNN2fSwoyox3
	 Tr1JLnMtphDXazXIhB35wDRjeNVX0SfcW8LWxGwsaYXN+AOtUbyMoR57S/UjcxHfpN
	 /6XOq52okYmkjpAm0Wu4FGznrT3bHIVAk5HRQP9w=
Feedback-ID: pgupta@hindutoo
Received: from mail36c25.carrierzone.com (localhost [127.0.0.1])
	by mail36c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 48KDfVhM094486
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Sep 2024 13:41:31 +0000
Received: (from webmail@localhost)
	by mail36c25.carrierzone.com (8.14.9/8.12.2/Submit) id 48KDfUdJ094453;
	Fri, 20 Sep 2024 09:41:30 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: dknueppel@online.de, quic_jjohnson@quicinc.com,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: ath12k - HTT timeout error with NCM86
Date: Fri, 20 Sep 2024 09:41:30 -0400
Message-ID: <1726839690.xnskyi9sg84wgsw4@mailapp03.register.com>
In-Reply-To: <1920f9bd1b8.285f.40f506ff0c43803c7e4cd5785e25da93@hindutool.com>
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
 <eb1c8576-bf2f-4ec0-8651-62e97446e940@home.xx>
 <2271e7e8-2e25-42e5-a162-e79f65ee8798@home.xx>
 <1N4h7p-1rrEib2AJr-01163u@mrelayeu.kundenserver.de>
 <1920f9bd1b8.285f.40f506ff0c43803c7e4cd5785e25da93@hindutool.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudelfedgieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevvdehnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkjghfgggtgfhrsehtqhertddttdejnecuhfhrohhmpedfphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmfdcuoehpghhuphhtrgeshhhinhguuhhtohholhdrtghomheqnecuggftrfgrthhtvghrnhepveejkedvieehtedvteejleefueffffeviedvheeiteeluddugfeuheffhfetveegnecuffhomhgrihhnpeifihdqtggrthdrrhhupdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhhvghlohepmhgrihhlfeeitgdvhedrtggrrhhrihgvrhiiohhnvgdrtghomhdpmhgrihhlfhhrohhmpehpghhuphhtrgeshhhinhguuhhtohholhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrthhhuddvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehquhhitggpjhhjohhhnhhsohhnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepughknhhuvghpphgvlhesohhnlhhinhg!
 vrdguvg
X-Rspamd-Status: No, score=0.90
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_064138_641919_C278EB55 
X-CRM114-Status: GOOD (  18.52  )
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
Reply-To: pgupta@hindutool.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

I purchased my hw modules (2.4, 5, 6 GHz) from compex. They were not recogn=
ized on my std Ubuntu 24.04 installation. According to compex the hw bit ne=
eds to either be hard coded into the module or a software patch applied. Be=
cause I am using all three modules in one machine (Dell R730xd) and using P=
CIE to M.2 riser cables they had to hardcode the identification bit and I h=
ad to send the modules back. I would ask your hardware manufacturer. I was =
told that the encoding will vary depending on the use of the module.  You a=
re right in that Wifi 7 has proved to be exceedingly difficult compared to =
the wifi 5 router I built. I have almost given up myself but continue to fi=
ght the good fight.

Cheers

Prashant gupta



On September 20, 2024 6:17:01 PM Dieter Knueppel <dknueppel@online.de> wrot=
e:
=C2=A0
I'm wondering, is this the correct mailing list for my questions?
=C2=A0
I know you are all working on best effort basis, but at least my
questions related to supported HW shouldn't be too complicated to answer.
=C2=A0
The information I found so far are almost not existent, stone old,
misleading or even proofed to be wrong (e.g.
https://wikidevi.wi-cat.ru/Ath12k, 17cb:1107 equals HERALD-BE as well,
not sure who maintains this page).
=C2=A0
I'm almost at the point moving back to my legacy HW.
=C2=A0
Anyway, I would still be very happy to receive any feedback :-)
=C2=A0
Thanks a lot,
=C2=A0
Dieter
=C2=A0
=C2=A0
P.S.: Due to my background in mobile networks radio interface, i would
have a good starting point to contribute myself. Unfortunately I'm
involved in plenty of other things and don't have the time for another
job :-(.
=C2=A0
=C2=A0
=C2=A0
=C2=A0
=C2=A0
Am 19.09.2024 um 11:41 schrieb Dieter Knueppel:
Minor update:
=C2=A0
I just figured out, that even the physical machine with std. Ubuntu
24.04 server (before the VM gets started and PCI device vanishes on
PM) reports: "Unknown hardware version found for WCN7850: 0xf"
=C2=A0
Hence the earlier question, whether "MSI HERALD-BE" or "Gigabyte
GC-WIFI7" is supported, seems still to be valid.
=C2=A0
=C2=A0
Am 18.09.2024 um 19:54 schrieb Dieter Knueppel:
Hi Jeff,
=C2=A0
thanks a lot for your update on ath11/ath12 related vfio support.
=C2=A0
That's actually bad news!
=C2=A0
Do you know whether vfio support vanished per accident or intention?
=C2=A0
I.e. I'm wondering on why the ath11 patch haven't made it into mainline?
=C2=A0
Assume there are no other 802.11be Chipsets supported by Linux, which
can be used as AP within a VM?
=C2=A0
Kind regards,
=C2=A0
Dieter
=C2=A0
=C2=A0
Am 18.09.2024 um 18:13 schrieb Jeff Johnson:
Resend since I had a typo in the ath12k e-mail list
=C2=A0
On 9/18/2024 9:05 AM, Jeff Johnson wrote:
On 9/18/2024 7:40 AM, Dieter Knueppel wrote:
Dear developer team,
=C2=A0
I have to admit, the earlier post "HTT timeout error with NCM86"
is my
fault, sorry for causing confusion.
=C2=A0
Due to earlier tests with legacy cards, the PCIe slot was still
forced
to Gen2 :-(
=C2=A0
Putting it back to <auto>, with "MSI HERALD-BE", similar to "Gigabyte
WC-WIFI7" i
=C2=A0
consistently get: "Unknown hardware version found for WCN7850: 0xf"
=C2=A0
Which nails down to the question whether any of these adapter is
already
supported?
=C2=A0
The M.2 NCM865 card as such seems to be supported.
=C2=A0
I'm wondering about the difference, as there seems to be no
additional
logic compiled
=C2=A0
on one of the two PCIe boards, just bit of glue logic.
For better support on ath12k driver issues please include the
ath12k driver
list (I've added it to this reply).
=C2=A0
In your original e-mail you said:
I'm trying to get "MSI HERALD-BE NCM865" up and running within a kvm
The ath12k driver does not support running in a VM. Even prior
ath11k-based
hardware doesn't support it.
=C2=A0
For ath11k there are some manual steps that have made it work, so
if you are
adventurous you can try doing something similar with ath12k. Refer to:
https://lore.kernel.org/all/adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com/
=C2=A0
=C2=A0
/jeff
=C2=A0
=C2=A0

