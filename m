Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4ADC44508
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HD+/nSixqFwhUNrYPVI+z6DSeUlu21xZXSgevbF+e4=; b=YVWLMKOdxcX/dWnqKmJrIe4WXX
	hHC4WrGVNxQ8fgNzK6R2KivHaufLwt79SA5qXbRMfvaxFMHCxWxAK+ez3o3MnYggIIAq54nJf7Z4F
	nv52ndzI0LIPZepliM5//LmGAaIbicvzOAc5ngpApu35qVNNk+A5MOIr/Ylxqc2gZV0IZCth1joWK
	43+lyuD3gmfSTNrH/4ctGvYPsgtlmhsEp083pYJwGZxVpbEIY2RQ3Y34T5XCOOo0wGMd31gY7abbu
	/MWl0yGPxUOVSag1dMDQ0PM423xPuax+CHHzGRFDAxUh4zIekpzIyV4Rgzcc5FLElv7SdmEkQMlqw
	X96TUW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfc1-0000000CcTC-25GX;
	Tue, 14 Jul 2026 16:04:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfby-0000000CcSe-1I8r
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 16:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784045037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HD+/nSixqFwhUNrYPVI+z6DSeUlu21xZXSgevbF+e4=;
	b=D/nounvZ1U0TPRdcZGY6364AUmmv6Ts6D4u1vXHhqLqov9IkikspnslhybVUBtaYOuKZ+H
	aqGTrf8gD6kTBq5UtFzrjqkmejKRZ8OM0jXSc+V8jV5NPhrfXc5cJCU7q8ntLpf0KG1BiZ
	HmTvlXqFQW9ey3es0aYvHDmn/57RJiE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-mGULl9C1N_i7T2PYcjMyGQ-1; Tue,
 14 Jul 2026 12:02:45 -0400
X-MC-Unique: mGULl9C1N_i7T2PYcjMyGQ-1
X-Mimecast-MFC-AGG-ID: mGULl9C1N_i7T2PYcjMyGQ_1784044964
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C572D180025A;
	Tue, 14 Jul 2026 16:02:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7833A414;
	Tue, 14 Jul 2026 16:02:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: hujy652@gmail.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Tue, 14 Jul 2026 18:02:38 +0200
Message-ID: <20260714160238.664089-1-jtornosm@redhat.com>
In-Reply-To: <CAHGaMk_FbjCShGw++0m9UT+sK+w23okwvx1vkqid6n9M=WScxQ@mail.gmail.com>
References: <CAHGaMk_FbjCShGw++0m9UT+sK+w23okwvx1vkqid6n9M=WScxQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: pednfRf3H0GIOpUXTDZ2YC0399pmMHo4Pjx348HR13c_1784044964
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_090358_409553_415F6DCA 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Zhi-Jun,


> While you are reworking it would you mind looking at the previous attempt?
>
> It tried to follow the behaviour in ath10k but lacks throttling mechanism.
>
> https://lore.kernel.org/linux-wireless/20230501130725.7171-1-quic_tamizhr@quicinc.com/

Thanks for the pointer. 

I have looked at Tamizh's patch and the main difference with this approach
is that the ring free space check is done before dequeuing, so the skb is
never consumed when the ring is full. This avoids frame drops and the
-ENOMEM errors we were seeing.

I think no additional push mechanism from TX completions is needed since
wake_tx_queue is called frequently enough under traffic to resume dequeuing
when ring space becomes available.

Best regards,
Jose Ignacio


