Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BC9C54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37XdsY1X1f+aS6JptCY/qd3SYUiAnJzvSx4grkQjdVk=; b=Ib5tFIdGLUMjkKJv29GxCHrBuf
	5lQK5mCJk/MgySiGylj6LEyxBaAHhq9qK/msHWtScwbCwuUyYxqGaVtTbQ1NFohuUOifYRC9hhS6U
	bFtDoGhpkUCsL/gKJ9v+Z95EKSUPXt//JGYHxbairqxgpDlUzQJpO42qCoh2OYUXrIKZyQHFHHDl+
	9klC/yVWb4JhwKaPcbJBUO7qoEIDp4Y0p5k2TzJM1bnD8b9FloJsWpKDq5dNgY4I6gdW1mta6GVwu
	vh6jeiVr3oEC3LRPCofXkY7TQoe6jb6t+KHp02xKlB4kGaaQ4HZE20VvrVATBb5cMP8qqGUEoDwjy
	6HGwndMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkg4C-0000000DUNw-4Axg
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 08:03:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkg48-0000000DUN2-3lRD
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 08:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=37XdsY1X1f+aS6JptCY/qd3SYUiAnJzvSx4grkQjdVk=;
	t=1710403429; x=1711613029; b=nMKxqJ5EI9C7qj24INVmqkjIm65cXDE+L5BqeWg319e6zmS
	vHFee9pREntRpCxLBZ8C+MCC16T/G47eqd5sYNUMcDftv9S0ThGgeHyMtLq9FsbHbHnVqNJdER+xj
	0lvf/+SW5LQUT+28hJ0uaTwyE3oUJh9yE2ynfH7wKKnDORUmRg0R2rtCwdnZpt29PN+Zmko1yBKKM
	c2VgCydK7Hc5JV2hxjbEjQvJv7RpAWE+N89EhMsSHEJe/yki9ih5Vea2UMagtxK0+TsIL1nHGoY1Z
	PnUooxkSeWLPVmZqgxgt8wjH2YiZaUUsXn7YQ5EHLmP4MBki/A4Ilqfh+yU71Puw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rkg42-0000000GQd6-07OU;
	Thu, 14 Mar 2024 09:03:46 +0100
Message-ID: <24017bc8d01a92df6a21acb244644c5d975407d5.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing
 bitmap
From: Johannes Berg <johannes@sipsolutions.net>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 14 Mar 2024 09:03:44 +0100
In-Reply-To: <4f79391f-cd81-4a3d-a236-447cb4c1f4d2@quicinc.com>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
	 <20240312045947.576231-2-quic_kangyang@quicinc.com>
	 <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
	 <4f79391f-cd81-4a3d-a236-447cb4c1f4d2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_010353_315483_5D050629 
X-CRM114-Status: GOOD (  12.53  )
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

On Thu, 2024-03-14 at 11:21 +0800, Kang Yang wrote:
>=20
> On 3/12/2024 4:16 PM, Johannes Berg wrote:
> > On Tue, 2024-03-12 at 12:59 +0800, Kang Yang wrote:
> > > Current mac80211 won't parsing puncturing bitmap when process EHT
> > > Operation element in 6 GHz band or Bandwidth Indication element. This
> > > leads to puncturing bitmap cannot be updated in related situations, s=
uch
> > > as connecting to an EHT AP in 6 GHz band.
> > >=20
> > > So supplement parsing of puncturing bitmap for these elements.
> >=20
> > Hah, yes, I just noticed that too and fixed the second part yesterday,
> > and was still thinking about how I could test the first part :-)
> >=20
>=20
>=20
> So what are you planning to do with this patch?
>=20
> Any suggestions or you want to add puncutring bitmap parsing by your patc=
h?
>=20

No no, all good. I was just commenting :)

Once the trees settle and all (we're in the middle of the merge window)
I'll apply this.

johannes

