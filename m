Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF6CC6B0F
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=; b=umLTsCONxb39VUuzKoJqMSUauH
	dFHwoxbeiQGpyvwH29PH2IwfW/+HrES0/NV486/j1ru8e6nnQI+3/fPXDSlbbtZQyjab9xVtm3w+z
	xP1xh+1H8HScctnvg0tt9GJ0bCaurgZeDWCociT72BRs2jgbjkyxr1R+Q5aQ2dAJxtZWLtNYGul/B
	sRE7XBVJcIUTN+t3A0hGRR4AUNk32vV/k5DrwL16WL1xR+2l66huf6Bu2ovp67xVmrgmGJqHYBBU6
	g+uYcTx0r+Wm+TyWgw2V9KqDBChyEF9UYCcRmVIlY3jbW+fjsd10IAfblbenP8ghSRDohIJJmwAdH
	Fu488y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd6g-0000000D208-09jY;
	Tue, 13 Oct 2026 14:03:54 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd6c-0000000D1yl-02Qz
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 14:03:52 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-988c7371716so712256241.1
        for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791900229; x=1792505029; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=BgTG3MB7k+nAbiRCbEWRFc3S8TSOo5DdcuhDUkwt/lxiOUzJhx/Yvj5ski+gTkzXVE
         vep7AcC0WTVWzRZKQVZhWbwfIuG/cWZJZr5sSUyxPsNgqpWlG2f2IBcT3MbUyDn6O0nv
         iMRHmm9H9OLtcJkJ/6IZXmDbhzYNB/pYYdTTzoYgUUFV3ot8+28qeLLtsp7d4KZRQOCU
         cKJcH2NiC/WbuIgpvF45Ujb4EZgb5lLU6scvX0ZXxbVfsgJJKZ0FxJU6kskJBpGtYNoX
         OUl1POTeBhSSnAEP4icuxS25IhQMrqudqjE8tFZBqWXy/5ut0I8rha6dXPJjxz5JwfkI
         bpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900229; x=1792505029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=u4vXyoG9TM03mSp71B5+PlHuUM+c3L2kasfCB7EN0zfk57RIm7EQClLzE7pj4p6XrS
         r8MTl+MnpmZsKyhO7MGL5+S02CW9v1sIufTlBGq7ms4LlgKwU5aL4FKeqv4pdFLGvMK1
         RW6Zx4PLyGetB4RKwgdJ0NSj23vE+728cg3g35kyVaxVM5QvGGKv8w3UuYH6e3/cuYtY
         El8T4qEg/RDtWH4GTmq3hzoS49SsjTrjC1qHmeQ9y7KVnZ+Iaoa5BlA/l0sgfb048SvA
         zeZ1JtPJhXviCL9QIrOEkbqMhg4uwDOhSbowYru0OtcRbrZoN1sTT7KNh+ZamAGki7aR
         VbGg==
X-Forwarded-Encrypted: i=1; AKwUvBxKp2llN1nBt4t/TnK8KmEy1dRkMC9bol+X8SsZX4g8HhYmhyIvoHF2J9b+POiyVxjx7IwR6u0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLcUV097JS3Lg5yd89wu44dP6b2xCHMuWSqBgyLNkZooVk7rsP8
	8dfz/gso/bTjepEjnazqU+7OKKIkPfsdluIZGxlk3iZ06ji7h0h1K5PGimgwJ2e3Hgs=
X-Gm-Gg: AYBFou1Q6gXdjeE6Mn6+IewvmjUKXVEzeObGFnzl6Ajed3Qdmk4OT4Cx1nEAS5Au9i9
	wADFGHyAqp+zSt9Ii6gsVq5XX474EIbatjwxiC1F+vhi/7sE7FWyYV2VOjvNoyMtYwmaQxQ73kn
	mbaf8orB6x8DqZofqeknaVi9j4j/I77RaZmN2Fs4fCfyvY5IPIGBc6MxTUMob0paar9OzSqnSiC
	KcUaQ7uAyHtmOJ5JepgNkdNStchgkTcqUmW1G1MA6tCkfoVSvG+vaWmWsbHKWkgAAVLSJr8JboL
	XHQUZhLEYp3El++TJA2aaxmdTrf8Xs/xyc0eW+T6Ff4O032zDkIYbtgIpOwizpelAgOi9bTKTA4
	5LOlTPcXzQViEoZfKSaLJPxft4/J3cZsvdCXiCSOQJEvPXQ6Cwm4quIWk9ezmYJQA+hrX0S2w61
	qltU+8hv2bvefxcsLx4ioza1cMfyzGgH2w2z9r7HY3SoUPSullkao8FFFrKASZ7q+32fomfWRoH
	gxqw/15WkaCH5CBr+beCBWmEHy11nSkluybyKCTHRtm9GmRqAM8EOW+ZQ==
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3183710137.32.1791900228555;
        Tue, 13 Oct 2026 07:03:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm25903626d6.40.2026.10.13.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:03:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGd6X-00000009i6J-387e;
	Tue, 13 Oct 2026 11:03:45 -0300
Date: Tue, 13 Oct 2026 11:03:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261013140345.GK14213@ziepe.ca>
References: <20261011132558.GD14213@ziepe.ca>
 <20261013134317.174234-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013134317.174234-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_070350_503715_C9D4B1AF 
X-CRM114-Status: GOOD (  21.83  )
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

On Tue, Oct 13, 2026 at 03:43:13PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Jason,
> 
> I understand the concern about compatibility implications, but to
> clarify, my intention is not to create an ABI or a "MSI caching
> concept". 

It very much is an ABI, you defined a new ABI in the config space a
layout between guest and host that we have to maintain forever.

Just for a hacky solution, it is not so nice.

> I can explore converting ath11k/ath12k to
> platform_device_msi_init_and_alloc_irqs(). However, if I understood
> correctly, the VM problem remains identical after that change — the
> firmware still needs physical host addresses, and device MSI domains
> in the VM would still provide virtual ones.

Yes, but it removes the solution of copying data from the existing
MSI-X table from consideration, which is the primary hacky thing here.

> I'm happy to do this refactoring if it opens a path to get these
> devices working in VMs. What VM mechanism would you accept for
> exposing physical MSI values through device MSI domains?

Once you have a MSI domain you just need a driver wired into it that
can request and get the physical addresses from the hypervisor. Then
when that domain is in use the guest will always see true physical.

That part is easy enough, it already exists and you don't need any
driver changes.

The bit that isn't clear is how you get the domain in the first
place. I suppose something like a virtio-msi is a good starting point,
but I don't know enough about ACPI/etc to imagine how to wire it into
the flow.

IIRC hyperv does this, so maybe there is something to follow there..

> Jeff is escalating to Qualcomm engineering again (thank you for
> that), but users with deployed hardware need something working in a
> reasonable timeframe.

Yes, but it has already been years, and Qualcomm doesn't seem to care
about these uses cases, so I'm not sure I see the urgency to do a bad
ABI hack..

Jason

