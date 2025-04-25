Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934FC369D7
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4RQReNZBGnV8PCNfSv0SZs5dApyh0rEnMU9Wrzf0/8=; b=RCRrsSeMeEX+UIHrS+H8py49Rg
	8WPGTiXNj1SeMRckrH5U05GTa4bYFl9w3vPcniZJ1DngVNg8nf8b246JiOwg9jAMQZBfwNQ5onMAS
	EgplIujQMw1OTQK2dI+3rF4lz/AiEpZCQpixUeCs2NXeMhgaBKA38Mra0PWo+ELInX2EWYnZan8Dd
	1LRcGKarpZvVMCk7N2OWQk44RyFxnNRKgd4BPKxvkIsPXsq4zvvfqojJYeFvNCUYzMBOu84ElWhIC
	tb6c31ugN+AZRA1MP9rRQn/YP6LtyPihy3yTOBFvbOQm9mZIjzqpPo8COp5jmuFs619F+7m5PzXCg
	0T4OxLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Imb-0000000HDux-1MbA;
	Fri, 25 Apr 2025 13:07:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HcB-0000000H1e0-3AWv
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 11:53:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3125659a12.0
        for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745581986; x=1746186786; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4RQReNZBGnV8PCNfSv0SZs5dApyh0rEnMU9Wrzf0/8=;
        b=fI4IN+2PUZnXqARS/tAAOYdlIItM+mkxmDTO2UqILkUCXLtoh65oarC9M7QvJQCxTp
         8JHucgIfeB30lUNkGKE3/NAaRWslgXn1xsmHxCIhzZ3JgsY8exhPDsys8sVWWP4GuJDt
         3irEvISya6BOyPCrqD2hFRaBOnPLYgM0TOGfjHnhXF+OAB8NTDXvPIcZ/By/IvnMP55g
         yMpY2Oi1ykFfX7td32n+56oxbE23yaHALyHhPgCwj7a7IzhKioglJhQ2j3earIydvaK5
         pMu8w1v61lwj4CfPAV/h/SmgC0oTxnDEc/wu2PRle8azXsuMq6ffYKXFqn7MVX1x1mdU
         IURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581986; x=1746186786;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4RQReNZBGnV8PCNfSv0SZs5dApyh0rEnMU9Wrzf0/8=;
        b=QcPQpATh0d3rsChht4XE+bXBHHu3+3GHdjzyXDCHkOgfXVgiBuoV16piQe0b1Hg6pO
         f2wWz5z6aaH5kdLjUxPiXFxoa3OQk1CIGa/aNpyHyaGeKZAWTsMcOeB8IXYQD3KuMsJb
         5w8hxq1WWTpBUhftrAzmuXS2QGZ8kcQahu4xMjsDeNSBAi830zdceVIPAtcmoPd3cRxi
         1hrr2H1RgIKtSErEI+5BZ/WobWW/j1ejP9fixDdRRelo+adFWTwq5uDdBKPvD8lN2YbR
         WhgCq3j6gFPjzcMr21zzlgyjBpxjauG1YzVCuDkimFIri3DBqzCHxxUcxq/EWGxFwIDB
         Pq/w==
X-Gm-Message-State: AOJu0YyL/h54jr2suJklDD6YJcbwaVgHbAnsNPJXMfY0o+dcfxC4KV7Z
	zpJI0LcfJw30wqbZKNWHIC7pw0Peq62UfDO7ET/JOo4FeF/v4WQo
X-Gm-Gg: ASbGncs+/qxPeEfNi7ZrzNqfGQj3qKvwm0oT+ZpCOBwia3mDyNM/g3SE8xhslXYZbos
	lkbx8nKoXOi4Y6hm+HrPC1XJ8yk+9KKsdS02Rig/3rIZtFKlnyYDqverAnJ+rwSSU1XA0o9IhUn
	JOlVwT0mY3O30ALEJ0gsE4dSW0Q1YIRXFL3r9IBedk8CrZpfi7fuQjEtrBse+5lQ+e0PEB5wUK5
	p2nUe7r0Ml3MVSMZnG+PQ2b36cDqh/F2lMikDWt1R6QAAVZaDMkpHRZXwFTScLDPeQwgb4Zp9qQ
	tuybLOVnGGU+4z3M3isFqorMlAnR9CGshQSMNtiPqGlgvEhx4t2clfJXiBj3dpFOfWfv0u42V08
	mwJ5MlIQE60tTeqSKRxmt4QF24+aa
X-Google-Smtp-Source: AGHT+IGnnQsq6FRvV1DiWg0b1ZaPB2E66qabRLYZVamdd6BIFbsL3JhURSOXonfuk1KXAHbrjn708A==
X-Received: by 2002:a05:6402:3582:b0:5f4:370d:96bc with SMTP id 4fb4d7f45d1cf-5f722673ab2mr1487536a12.2.1745581985534;
        Fri, 25 Apr 2025 04:53:05 -0700 (PDT)
Received: from smtpclient.apple (7-253-142-46.pool.kielnet.net. [46.142.253.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f48a3sm1175157a12.34.2025.04.25.04.53.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:53:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: wifi: ath12k: MLO not working in main/main-pending for NCM865 /
 WCM7850 in station mode
From: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
In-Reply-To: <a5bceb0d-bc44-4bf8-b08f-b56b637b28d6@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 13:52:53 +0200
Cc: ath12k@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1F01BA0-8B75-4B62-A060-D43C666820F2@gmail.com>
References: <231C035E-18AD-4ABD-91A5-841253644C2B@gmail.com>
 <7001407B-8507-4CD8-B96A-328927D6E286@gmail.com>
 <FBF5892D-0A0A-4AF9-9D53-B3C76673D797@gmail.com>
 <a5bceb0d-bc44-4bf8-b08f-b56b637b28d6@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_045307_794583_DE20A340 
X-CRM114-Status: UNSURE (   9.49  )
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

> On 24. Apr 2025, at 16:28, Jeff Johnson =
<jeff.johnson@oss.qualcomm.com> wrote:
>=20
> On 4/22/2025 10:35 PM, Benjamin Eggerstedt wrote:
>> Hi,
>>=20
>> I compiled main-pending from here =
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=3Dmain-=
pending after "Merge branch 'pending' into main-pending =
ath-pending-202504182357 master-pending main-pending=E2=80=9D by Jeff =
Johnson. I tried =E2=80=9Cmain=E2=80=9D the day before, but saw that a =
couple of additional fixes went in and redid the previously and =
unfortunately still unsuccessful test
>=20
> Response from the development team is that the current public firmware =
is not
> MLO capable. An updated firmware will be pushed soon.
>=20
> /jeff

Hi Jeff,

I appreciate the feedback, thank you. I=E2=80=99m happy to compile, test =
& report back once such firmware becomes available.
Feel free to give me a nudge here.

Thanks,
Regards,
Benny=

