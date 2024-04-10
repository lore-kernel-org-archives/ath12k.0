Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83001CD1296
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yJzNJsbUcZyMZ+JVyPnDvNkzO3Jhk9AuCTJ1rgbO+o=; b=cOZvazaD/T4O8XNOhVO1gBV9W7
	xf8Gm5nLiw37NdeSdRRcgxUmt9I/DLFVLAGmCpLEV+ZuuxalLj7l62KKavOjMJIOxXxILyEruRPl5
	bpFAz6TDQizr9xEsuVEME11Fgh15R3DkvBKVhBvxiryWzOpraGQYOxxg3nDDukGX6O070cZEDZiw6
	qtPIeauSts5TCHq6MiQA9Wrhw9RYxPuGaYfQkZDjNkXcNxNydqlIfnvbmrLeDPw1b82TprTUMko5C
	jXaBES1XeL1earQfYysOa0igX0XOxLC7TEjTEZqZmpd5iEbfZR4snMI6cuXNjI+iwx/35O1lqtEYT
	Ms8aX4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSrN-00000005kRu-0QUr
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 07:59:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSrK-00000005kPz-16hu
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 07:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8yJzNJsbUcZyMZ+JVyPnDvNkzO3Jhk9AuCTJ1rgbO+o=;
	t=1712735946; x=1713945546; b=k5mbr8QHe/KwCdfgNtfhfL8NVYiLGB+01qShwimqjHB+11K
	4bVWdYo26d+Ghd1bvM9kGm6Wazx/zFrPeAu3l0PRf5+mvBv5yUcJFfS05QADjNrRJ8A829p1F4Iw2
	56QyaNhGCN58VsPniO2iJI303sVRyIu/i4x1upAvKczzhf4IvM+xJYhpxibyIzueVY3U3BHvBNaCq
	05slEyymRHVvtNiKKU6zso39wLspIgotmwy8v8/uRLyEgs/YgtUY+Ewc0t/o9C88d3BMY/oQHfuEY
	G5yCTxMLO67dEZm6IaUEvha76uAJq1qGd6eTtmggoLRMYzOvEqeg1QB3naNUVcnw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ruSrH-00000001EoS-3zUt;
	Wed, 10 Apr 2024 09:59:04 +0200
Message-ID: <902dd36fa5ab0503377e558b92505fe499f666fa.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Karthikeyan
	Periyasamy <quic_periyasa@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jakub Kicinski
	 <kuba@kernel.org>
Date: Wed, 10 Apr 2024 09:59:02 +0200
In-Reply-To: <b455f267-9552-be3b-95b0-a036bfa8e14a@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <b455f267-9552-be3b-95b0-a036bfa8e14a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_005906_333934_BB84032E 
X-CRM114-Status: GOOD (  24.71  )
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

On Fri, 2024-03-29 at 19:51 +0530, Vasanthakumar Thiagarajan wrote:
>=20
> On 3/28/2024 5:31 PM, Johannes Berg wrote:
> > On Thu, 2024-03-28 at 15:48 +0530, Karthikeyan Periyasamy wrote:
> > > On 3/28/2024 1:19 PM, Johannes Berg wrote:
> > > > On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
> > > > > +/**
> > > > > + * nl80211_multi_hw_attrs - multi-hw attributes
> > > > > + *
> > > > > + * @NL80211_MULTI_HW_ATTR_INVALID: invalid
> > > > > + * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the =
underlying HW
> > > > > + *	for which the supported channel list is advertised. Internall=
y refer
> > > > > + *	the index of the wiphy's @hw_chans array.
> > > > Is there a good reason to expose this? Seems pretty internal to me,=
 and
> > > > not sure what userspace would do with it?
> > >=20
> > > Hostapd use this hw index for the channel switch cmd.
> >=20
> > What, where? I don't see that in this patchset? And why??
> >=20
> > In any case, unless I just missed it and you're going to tell me to loo=
k
> > at patch N, we don't need it here, and then I'd prefer to keep it an
> > internal detail until it's needed.
> >=20
> > > The hw index used as a sanity check to identify whether the user
> > > requested channel fall under the different hw or not.
> >=20
> > You mean within hostapd itself? That doesn't make sense, it can derive
> > that information differently.
> >=20
> > > In split-phy hardware, 5GHz band supported by two physical hardware's=
.
> > > First supports 5GHz Low band and second supports 5GHz High band.
> >=20
> > In your hardware design anyway, but yeah, I get it.
> >=20
> > > In this case, user space cannot use band vise check here to identify
> > > given channel or freq supported in the given hardware.
> >=20
> > No, but it also doesn't need an index assigned by the kernel for that.
> >=20
>=20
> The only purpose of hw index is to link hw_chans to per-hardware=20
> interface combination capability so that each hardware can be
> identified during interface combination checks capability vs
> current state. Thinking if we can embed the channel list also
> into per-hardware interface combination signaling by giving the
> pointer?

Maybe? It might mean more allocations where the use is concerned since
it can't be "static const" that way.

I found the code that needs it later, just that Karthikeyan was using
the wrong explanation for it ... I'd hoped he'd understand your own code
better ;-)

johannes

