Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE621C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H03hzERz4JoxgCmruYHpPPyb6baJd5J6GUwTegv6RDc=; b=OZKjVO77GQVnSi6RrcF5/62sz2
	ySFiYNlfMJCc/KzjFEx+cEJE852aq2iwZO5PxDMZwNPvs1EPCOWSzYD5NTs5ReNCnOfvqn7HICyDc
	Nc08ABbNoLWs26GxC/o3NpRtn1UUJwmPqh64q9T09LZTZy/IhhsQPeg4Z6v73XkMCNdPp8wR7uKHm
	fF/Quum+P/EqacX113KrkjGxDxWI96CD4DtcHY3I62AKyFBGJAl99YburVqw0WM2ysZ8WlSlflZ7Z
	B6M3WNnxaZFOZwwFgQoGl92IM2baOYLsI5b+J3djHXNwge/9mayQ2MqJXqwV0ga768sXX/H0hzmdf
	gH5EkMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l9P-0000000GNMY-1vJm
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 17:32:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l9A-0000000GNDR-0D4z
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 17:32:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a5a13921661so4258766b.2
        for <ath12k@lists.infradead.org>; Wed, 08 May 2024 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715189520; x=1715794320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H03hzERz4JoxgCmruYHpPPyb6baJd5J6GUwTegv6RDc=;
        b=VhPuzjpWHof9EX0nKbNsTJ9/wYXJqcVsLAVrQMCk6wt/vmqIIpGwWlCcDMcI77J9hj
         fcg1hdeaSizXnwuZxA4jKHtI0f4cnSxjqfBdNNw45kMfE5uikcnhWJfzDizRCikqzfua
         NQkk5xehnablfzVwdTRpickpK9lOaN7c78GtA/g5mgS8qbA4JibjFcR5wUHDN57vPWGC
         HGoh6xj+/oDS3VHBzoCbXeptm6a95kKgLwD6Rn7XoKLCje7fSnwui33wtqh5OhAA4pIe
         gq5j85mD1fdcihKOpTIYhdWwTHf5KV9GrFGxZjYTgqW7QOuhiIYqXx+9YTpgdOCn3/0A
         i5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715189520; x=1715794320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H03hzERz4JoxgCmruYHpPPyb6baJd5J6GUwTegv6RDc=;
        b=fc+XmJoFOg2CnOlGeIE9tAQ9kkxpcbVyD+KY6ywSiwItvA0TfCbydCe6Uh179lPlJ2
         DZdotZte78gzbaWy1Jdr32/IZtFEuDw/lhnA0S49jp7GbdFILU7hjOdVtOUFlT0oX9d1
         xaU1E6gINRdJOKyxAN3BH38x07OGeSJ4wROglisAQ+ql+h9e8qx4QJpYF1owNZWXSRIP
         OYCXl0pr8LkABevvxhWdTn7Abz60Cq+TLrbg++cpC9S94FsZLilpEO4KcpqGsquJkrxX
         EZb+W7Wsh74bXl3JCeb4Li47nWOIU+TMc/90+pD6L5ILbrwsvEycOr2d9LefnLS6msMA
         g3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXSQ5HIgQEOIfrR6upwmm7p+tRWQITtvQuE7n+8PXhz6nPFOxC5UiR7LMOUvk44jCAZYZqlz1L7vATr7HFjrXpOLjJZ8e0TkOHXQ==
X-Gm-Message-State: AOJu0YwJ5jZxMFUUsttyfv+Bx32BMlJ346HT9l2rTLvZ04vP0qPZ1UXH
	g4AqdhkWLmzQJXprQXCUaWanr+6SgtuC7xlnOOe6RkdAC6sw6Id4UxHqwL+wcaLJP5KqEXaKP7e
	B
X-Google-Smtp-Source: AGHT+IGSX5KYRRlOmtsIHtQh+KlGgLx9KF2+R8ni4Fasp/0KFSTJ1kLt8TkaHr7EIcs++L0+0+8LZg==
X-Received: by 2002:a50:9ec8:0:b0:56b:fd17:3522 with SMTP id 4fb4d7f45d1cf-5731d9b5d13mr2395210a12.14.1715189520241;
        Wed, 08 May 2024 10:32:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u1-20020aa7d541000000b00572eebbfc61sm4848712edr.35.2024.05.08.10.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:31:59 -0700 (PDT)
Date: Wed, 8 May 2024 20:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: quic_bqiang@quicinc.com, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [bug report] wifi: ath12k: flush all packets before suspend
Message-ID: <d642bb50-5d79-4968-a001-13bd075c70b0@moroto.mountain>
References: <7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain>
 <1abbdd0c-d4cf-4e24-9b68-d732b07300ff@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1abbdd0c-d4cf-4e24-9b68-d732b07300ff@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_103204_205563_D508A416 
X-CRM114-Status: GOOD (  12.77  )
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

On Wed, May 08, 2024 at 09:51:33AM -0700, Jeff Johnson wrote:
> On 5/8/2024 5:29 AM, Dan Carpenter wrote:
> > Hello Baochen Qiang,
> > 
> > Commit 692921ead832 ("wifi: ath12k: flush all packets before
> > suspend") from Apr 22, 2024 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/net/wireless/ath/ath12k/core.c:58 ath12k_core_suspend()
> > 	warn: sleeping in atomic context
> 
> Hi Dan,
> I'm not seeing this as part of my standard make W=1 C=1
> 
> What do I need to do in order to see this?
> build_kernel_data.sh ??
>

Yeah.  This is a smatch warning that requires build_kernel_data.sh
(probably you have to build several times which takes forever).  The
might_sleep() is in synchronize_net().

It's better to do run time testing.  If you run with
CONFIG_DEBUG_ATOMIC_SLEEP=y
then it will trigger a stack trace.

regards,
dan carpenter

