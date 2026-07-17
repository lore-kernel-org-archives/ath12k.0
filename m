Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD85C4450F
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 06:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=; b=RpA20gCMOJIxrrqHe41tKw/2Ez
	xa/B4lqIvRugdq0jtyH95zUfsrII5qJXvn/jiskJgiEM0R0JrpLgTLgjVflC6i19VZ73W3nYDj1R8
	Ri2VaC9qwPS1OJ/ta6iI1TZVYLBFZtaCBConPPY/0GP37MWEwaW06UHTMprU2c6hJAdUDFLKiFnpA
	Dc9Gz+Ukokz9ktlcM/mf0OqYL2+FTBmT1ozQZXsh/oNkFe9UTWGtyqV6P/ToNORYEyO3Z9hEqn6KU
	TIKkHbqi058c8ufmLAUL/9CaMjOOzD/BQv3pHvJdBWZslXC0qpPJ4VLRAgj/kk0KgPTSRfcfrFtn9
	06n/I9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbuH-00000001FgA-224O;
	Fri, 17 Jul 2026 06:18:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbuF-00000001Ffn-2ztC
	for ath12k@bombadil.infradead.org;
	Fri, 17 Jul 2026 06:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=; b=m8o6l2ETPeNgx6B2+hV29YTBVf
	OKjDk4BY2yOATLvqY8I6b4O/Cer1fY/5Xj+Xcen2iQjlHsP/GNCeokMfjl79S97VvVi8Ogw4llgq9
	sPvfalp3jE6Yz/kG/TmDUeQsqqBU+f3LWbg+1XG7A80pznkl9Tq+acj8qgpCeAoBPJY/VM3UdFiQY
	Pdb2Wexf1MSUguaBmaZ9V5dIoDJeHM2dqbnyvPH2FhgTcbpur7P1lTQ4sk2dUTVMnBcj7FbkVM8Hn
	Frw/FT6Ix6BZzqsC5LpHuhq73sBDe+gbVMNdpjh3QMT1BRwFYEkqpYmCBFFgYtVnlIizwDEtjnbTL
	AYHrxStA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkbuB-0000000EYy2-12QS
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 06:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784269116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=;
	b=iuC4NU0UNHW2dxBJerBU7LiqCKrZb5nHrZhp/IyMlRxXcx9B9BMt/n0RDTBWH/HbOx8N1F
	9mSSL9ddcDmWwJyYkuuJIYv7wEbjg/hRg016R8hjaneeHER6mV51e6/BfK2kM1HzD2C5Po
	jukqANlegSmKciNzROpBm9wR5LpcYW4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784269116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qed+1As6Equ23uWfRUM55nbFX9LN3crl8/5w+JaGi1w=;
	b=iuC4NU0UNHW2dxBJerBU7LiqCKrZb5nHrZhp/IyMlRxXcx9B9BMt/n0RDTBWH/HbOx8N1F
	9mSSL9ddcDmWwJyYkuuJIYv7wEbjg/hRg016R8hjaneeHER6mV51e6/BfK2kM1HzD2C5Po
	jukqANlegSmKciNzROpBm9wR5LpcYW4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-vzKCaRkgNuCMbvJRa-iPZA-1; Fri,
 17 Jul 2026 02:18:32 -0400
X-MC-Unique: vzKCaRkgNuCMbvJRa-iPZA-1
X-Mimecast-MFC-AGG-ID: vzKCaRkgNuCMbvJRa-iPZA_1784269111
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CE6E18005A9;
	Fri, 17 Jul 2026 06:18:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.53])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8372C3004082;
	Fri, 17 Jul 2026 06:18:27 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 3/3] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Fri, 17 Jul 2026 08:18:25 +0200
Message-ID: <20260717061825.327097-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKa26vR52mX85t4xuZbrXz0FiRc0O_NeDFSNAQpSx=RR7g@mail.gmail.com>
References: <CABkEBKa26vR52mX85t4xuZbrXz0FiRc0O_NeDFSNAQpSx=RR7g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: JAwcTSYgnv7ZxEZ5dJM_aqlNmM_5auY9XRaTgVDmVTE_1784269111
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_071840_853157_4335C19A 
X-CRM114-Status: UNSURE (   3.93  )
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

Hi Tamizh,

Thank you for the review. You are right, I will fix this in v3.

Best regards,
Jose Ignacio


