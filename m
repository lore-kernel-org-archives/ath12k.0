Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2219FC25B76
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9FeMr26BUyGKfUmTMWDdpwkUOTk7nTo7Plm0LALJKY=; b=geTUOM+ljcAvMbEPPrBlyRRdqc
	5wxR/cUVWS2RAOhn2uMBn4oa/CL8LAr7cMfH/l5XtoTKUHlYhBObbsu42kBtsTe00nFhh7lUxCY6F
	6R1YMW51Wiy0yKWudI2brodX/i/rNT7GTzGPwv6BzG5p1kELcymPrxeHl64VsbKHokU3Lq9OePa7H
	hO8h5bg4EHhSGPb2yzTftttIJfFEbqH7n/wt5/ff4OWKebuGfROuAANJVirCl0/BAR3ix/F6i0DMv
	uUxfgOjCRUVjiy/PwB8NXrh9QjB5UPNrPSy/LmlJCJuefEPKhJskWRk5r+4/rqoHPn6FIcawNNJpH
	D1ER0Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEEBP-00000000Hbd-36W8
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 20:21:31 +0000
Received: from mail33c25.carrierzone.com ([64.29.147.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEEBK-00000000HaL-2Zo6;
	Mon, 03 Jun 2024 20:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1717446073;
	bh=wYYoV7g0WvdZSAD+oWLLVWM6h9Ai7/dVs/nh+oAJmaI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=RJDwPawNf2LtS1acNxk60/SQIAkdP+ER1Twlw8Q3k5SYrDpeSoyu2Tupe7R6RpLY1
	 jTclTDoSyilzpbnZ85hMJUG9xc2KBjPFFuOqH1k612OsQ4mR7bUiizKV5AcVS+tbmL
	 QO5j+T/SoGGK19IsnxC+AcKxdraIlb9WiufLUg5E=
Feedback-ID: pgupta@hindutoo
Received: from mail33c25.carrierzone.com (localhost [127.0.0.1])
	by mail33c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 453KL8Gm003940
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Jun 2024 20:21:09 +0000
Received: (from webmail@localhost)
	by mail33c25.carrierzone.com (8.14.9/8.12.2/Submit) id 453KL87I003939;
	Mon, 3 Jun 2024 16:21:08 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: kvalo@kernel.org, quic_jjohnson@quicinc.com
CC: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: New staging repos for ath1*k firmware
Date: Mon, 03 Jun 2024 16:21:08 -0400
Message-ID: <1717446068.3fam2c8qo0gc0k0g@mailapp03.register.com>
In-Reply-To: <87ed9dn5va.fsf@kernel.org>
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <878r09gfzv.fsf@kernel.org> <87ed9dn5va.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelvddgudegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffuvffqrffktedpqfgfvfdpgffpggdqvedvheenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkfgjfhggtgfgrhesthhqredttddtjeenucfhrhhomhepfdhpghhuphhtrgeshhhinhguuhhtohholhdrtghomhdfuceophhguhhpthgrsehhihhnughuthhoohhlrdgtohhmqeenucggtffrrghtthgvrhhnpeegteehhfeghfejtedvjeevhfehveefgffhtddujedvhffgheejudevhfevvdfgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptghouggvlhhinhgrrhhordhorhhgnecukfhppeduvdejrddtrddtrddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddphhgvlhhopehmrghilheffegtvdehrdgtrghrrhhivghriihonhgvrdgtohhmpdhmrghilhhfrhhomhepphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghthhduvdhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghthhduudhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthh!
 toheprghthhdutdhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepqhhuihgtpghjjhhohhhnshhonhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehkvhgrlhhosehkvghrnhgvlhdrohhrgh
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
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Status: No, score=0.90
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_132126_956029_AD50382E 
X-CRM114-Status: GOOD (  14.89  )
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

The manufacturer of my wifi7 modules (Compex) suggested I use the following=
 repository:

https://github.com/quic/upstream-wifi-fw/tree/main/ath12k-firmware/QCN9274/=
hw2.0/1.3/WLAN.WBE.1.3-03253-QCAHKSWPL_SILICONZ-1

Is this part of the ath12k project?  I have seen it online but have not use=
d it.=C2=A0=C2=A0

Prashant



On Mon, 03 Jun 2024 23:11:53 +0300, Kalle Valo <kvalo@kernel.org> wrote:

>> Kalle Valo writes:
>>
>> > Jeff Johnson writes:
>> >
>> >> Historically, prior to being incorporated into the linux-firmware
>> >> project, firmware for kernel.org ath1*k drivers has been first publis=
hed
>> >> to Kalle's GitHub:
>> >> https://github.com/kvalo/ath10k-firmware
>> >> https://github.com/kvalo/ath11k-firmware
>> >> (ath12k firmware was pushed to the ath11k-firmware repo on a temporar=
y
>> >> basis in anticipation of this move)
>> >>
>> >> But in order to have repos with multiple maintainers, as well as to h=
ave
>> >> a hosting platform with more control, we have moved to CodeLinaro:
>> >> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
>> >> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>> >> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>> >>
>> >> Note that most people should not care about this -- normally you shou=
ld
>> >> use the firmware that is in the official linux-firmware repo:
>> >> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware=
=2Egit/
>> >>
>> >> You should only need to access the staging repos if you need a previo=
us
>> >> version to work around an issue, or if you are testing new firmware t=
hat
>> >> is supposed to fix a problem that you've reported.
>> >>
>> >> Please let Kalle & I know if you have any issues with these new repos=
!
>> >
>> > The final reminder that the github.com repositories will be deleted in
>> > two weeks. If someone is still using them switch to the new
>> > git.codelinaro.org location NOW.
>>
>> And github.com repos are gone now.
>>
>> --
>> https://patchwork.kernel.org/project/linux-wireless/list/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp=
atches

