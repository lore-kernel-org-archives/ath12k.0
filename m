Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23CFC48BC4
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79/Qzm2vJk0BAzjRMVt7ecM1kUIJeCMDLpwDD4uxJWo=; b=sWQJ73AGS4QQeCZAXE09IC0zw2
	RzjOzuylJnmJAE2GvThRykJr13zDUFaHir0H0WnKqXv4drCkK5xrusU6KlAky7WYG3w0i0yAnPlQn
	vZRWSnGv/Ze6yfpe/6lzKV/7qIsQroMdA9j5YQ+lOBRs9Xx4lg+cZX4eLvWS43L1eXcu5d2zVV1Za
	OtFsGSRvsBms5evSu56GAgBwdkRkZ86iJg8A9ZRCeDAG+j5ppj3oN5OilvHl8S71KX/+ySxll9dhr
	GXjY9+hwocCg6g7pARZofjv0MiPE+l3Ks9P9umkdkgOE6K7ta5DgCyTPwXSr7mQejtYLxJ2wcaoDH
	ybo1L4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCrc-0000000Ca1V-21E5
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 10:51:40 +0000
Received: from wfout5-smtp.messagingengine.com ([64.147.123.148])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCrZ-0000000Ca03-3qG3
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 10:51:39 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 9F5901C0007B;
	Wed, 14 Feb 2024 05:51:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 14 Feb 2024 05:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707907893; x=1707994293; bh=79/Qzm2vJk
	0BAzjRMVt7ecM1kUIJeCMDLpwDD4uxJWo=; b=1COWNVYH87gWNKMltpLJTnWw29
	E25ubIUcUwoHblWcT8XhX6017jq8mggn+2LzFzRLZizNfrUHM5fMdHu8tdqOUtbR
	Rut6m5DVGdTIAhwrtJtiuEGiWiyL/Sn8YqBDXndFO1YVxtyVzwtduSf3+6Fmo8Pl
	o5lCb5tnI5yfyyJMTUBjW4EJvcW9hwZeXVMifZy40bJDlrJxz5UGkSedmePUqTDD
	/E8PDeBP6vWghx6RKjgf2T9ZIDD0lVy8SQIjlVI3Qfol8hDi8E21vfT450NPVdkV
	q6qwj/uYa4tfVjt15cWHWMSFlXTaCdyjGXAwrYdUwq2sQCI9yHq46EHdHGJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707907893; x=1707994293; bh=79/Qzm2vJk0BAzjRMVt7ecM1kUIJ
	eCMDLpwDD4uxJWo=; b=nsQklX3H59Y1ufjMGSGzYWPK6jQicRXM1irJ7KW5dOEn
	yrQqdBhVESERXan/LkmJC7udmsuLmsLbGKrWRj5lsghVKDce2g+jq6LpYSb83DTu
	XvrY5b9vyAPAZxbNJZoadCu5OBx0RIyJth9xjpAwXPkzTHhK7IgopNm55Tw+Gd5l
	JzLxf5kFU5aY1KLLVBAlwzz4myfew2tSsHFCgmi3nBri7c/bYSYlT8SzhmeWfO+w
	+FqaPnAMbvODLnUyKD9LY3U+uT9xs4Qjc443xRytGv7ZwFLLZrsvTKdiVsFqZYYK
	0hmutfFuGrnr43rBfyihzXpYE+WEzR5M4Tie+msl2A==
X-ME-Sender: <xms:NJvMZYfsglnlEUxKurnhugeyEfdV54TEHGsGZkqh_shNIhg2nSGxLw>
    <xme:NJvMZaMbqiNeRXCSSbQieaooADEKvUtW1QoASI6QwH5mkTFGzqA2_ExsCiZPnUdU2
    96TSMRWpb2mcIZDezg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:NZvMZZiO5s_YjRzHQwE-h9yArVo-ZuFoSiP1JR6yGT4YOFzkCsaqqQ>
    <xmx:NZvMZd-ySjK4kgFCrJNikAQ7HJXyrUmYA1-h4n6hTkBM-BKSn2RC5g>
    <xmx:NZvMZUtHWgpkqZYz4Un54ZvXVuK4Ca_5VcICfU9iaGS2hJiHELoa6Q>
    <xmx:NZvMZVlC3VMgFqiA2sblIvjIjZ66Lo2oqeswXAyrJvNbcXvRorc6nj8D8YA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D6FFBB6008D; Wed, 14 Feb 2024 05:51:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <d9a7ad2f-c9a7-4886-8bbc-7a77771c0aec@app.fastmail.com>
In-Reply-To: <87plwze34l.fsf@kernel.org>
References: <20240213100912.459018-1-arnd@kernel.org>
 <170790025305.3179441.138152315558305278.kvalo@kernel.org>
 <08ac32ef-610d-479d-a3fd-a3c3b8c4c697@app.fastmail.com>
 <87plwze34l.fsf@kernel.org>
Date: Wed, 14 Feb 2024 11:51:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 "Aloka Dixit" <quic_alokad@quicinc.com>, "Wen Gong" <quic_wgong@quicinc.com>,
 "Muna Sinada" <quic_msinada@quicinc.com>,
 "Aditya Kumar Singh" <quic_adisi@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_025138_016741_ED9AD0A6 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, Feb 14, 2024, at 11:44, Kalle Valo wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>> On Wed, Feb 14, 2024, at 09:44, Kalle Valo wrote:
>>> Arnd Bergmann <arnd@kernel.org> wrote:
>
>> but I see it's not in linux-next yet as of today.
>
> Yeah, it's a problem that ath.git is not included linux-next builds. The
> commits will be in linux-next only after ath-next is pulled to
> wireless-next :/

Not sure if that is intentional, but if you'd like to change
that, you can just email Stephen Rothwell asking him to include
ath-next into linux-next as well.

      Arnd 

