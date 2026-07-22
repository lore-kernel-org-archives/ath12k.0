Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE19C4453C
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wORtUkuxibZxnGk6EjbUQDGPL3gg8q570y1SAxHEQQM=; b=dc5rE3gf7r12K9RhYk50PWFsOn
	dlb66Yf0MFegXvD835EMgWGYVX4njt62IMrAPahLFHGq7OFELbx1y5QaNP4EonjIBXfc9l/Vg1rk0
	W6YWJ+27D0L6fayvYqCzHMVntJcDtGnzGr0ra25h4bb8Z4VrGFyyS1d4A2ZeizGz7qDM/kkH8ky71
	exPAqxrvJFp1pky4PFgbDYx3bgeqQij+WDdsOgvhNOZbVefEJ9bsF+TJmfFA1nJzXF2bB44wyrnoM
	4RtPcO4oGZuUe7PqCKOBttmbEWcfw7YpJVfuqx1g+bdRE6bdly1m9/EeeM2bPmlX2J6UdjdzIPWQ1
	3uDoS9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZGw-0000000CGfA-1dHc;
	Wed, 22 Jul 2026 15:54:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZGu-0000000CGeg-3cD4;
	Wed, 22 Jul 2026 15:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wORtUkuxibZxnGk6EjbUQDGPL3gg8q570y1SAxHEQQM=; b=X3sRXDiluLXai0kzVtjqhg+v2S
	7e+Y+wqOyxYTT5ct74dvBvBAEjNtaJpD5ESgCb5+gXkBfvGCg+Z63GzUri+yeI+9Dy939ufnWDWfY
	cn/fj6DseWk/lIwQFeNR+PlFKw0auwrX2nXHsDN2gDk6ZcI229yRYvTB3LaDRWf52NylnqPdX5kRd
	Ay/qqobyK/3EDv3DntOy1+PjD+SrQmXATElrrc7Ry/1W6xj0m+qw1DfdX8IbYWCo+Lu8tKlAYsd13
	BwEBBWmyB7cEV8ZRAUUshkYXKDvwpCgSKbRrKwL+y7moXe8NYZmZVLswaW7e1MjMFhNKhioREoIUt
	CWf1zMmA==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZGr-00000000z1S-0yXi;
	Wed, 22 Jul 2026 15:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=wORtUkuxibZxnGk6EjbUQDGPL3gg8q570y1SAxHEQQM=;
	t=1784735649; x=1785945249; b=RJXzxzKHnI4f7W6ybTdjAilgoEE9LiCLkKs7Bu2d0muK648
	1cTiepcJ6q9yt6jIb4yxAim+I0N0orFB69vhz2HSeO3wZN9aIA3qy9iR0Rlq2st+33mx/bq84YEVD
	/OlPstoBBrnjbeZ5AtzNORYYJHLFRgjuOoN/VSjnxGnUhzgRVljfxYNxH56KTHVJzc/MDTx3XlEy1
	uGrUUzTFhbfafg73FyOBmrgn8Z8iQdqrWwWDXqBOXpIVGmrzThVfLhbtnflmdvS3oySoCxxuhga1S
	poo55BYHYNDUsIo9jmkrVd5NJsYjuXIckV3bd37J/IwheFfNYmursKEy8sG7Ajkw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wmZGl-00000004rfk-0hd6;
	Wed, 22 Jul 2026 17:54:03 +0200
Message-ID: <c43276c11a6b1ad888b5ca5c3a28de199b6c2d78.camel@sipsolutions.net>
Subject: Re: pull-request: ath-next-20260721
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org, Bjorn Andersson
	 <andersson@kernel.org>, Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:54:02 +0200
In-Reply-To: <0833afbd-4a25-4e7d-8e77-ab9fac9d36cf@oss.qualcomm.com>
References: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
	 <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
	 <0833afbd-4a25-4e7d-8e77-ab9fac9d36cf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_165409_359024_67EB22E6 
X-CRM114-Status: GOOD (  16.78  )
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

On Wed, 2026-07-22 at 08:51 -0700, Jeff Johnson wrote:
> On 7/22/2026 7:08 AM, Johannes Berg wrote:
> > On Tue, 2026-07-21 at 16:46 -0700, Jeff Johnson wrote:
> > >=20
> > > ----------------------------------------------------------------
> > >=20
> > > NOTE TO UPSTREAM MAINTAINERS
> > > This PR includes the merge of an immutable branch from the qcom tree
> > > https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.=
b4-ty@kernel.org/
> >=20
> > That's annoying, it added a kernel-doc warning that now shows up on our
> > output... I guess we need to ignore that.
> >=20
> > > New warnings added:
> > > Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found f=
or return value of 'qcom_scm_is_pas_available'
> > > Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found f=
or return value of 'qcom_scm_is_pas_available'
> > > Per-file breakdown:
> > >      2 drivers/firmware/qcom/qcom_scm.c
>=20
> :(
>=20
> I run kernel-doc on the patches I process, but since I didn't directly pr=
ocess
> that series I didn't see it.

Yeah, no worries. Also they're outside our normal set of files, so I saw
them only because of the diff, not in my normal "check everything"
process. I'm not really bothered by it, just a heads-up.

> > Note that the first of those ... the commit exists, but not in the righ=
t
> > tree. It's in some ath12k-bringup-start tag in your tree, but not in
> > mainline, got a different sha1 there. So checking locally is confusing.
>=20
> Let me rewrite those and send another PR

Thanks!

johannes

