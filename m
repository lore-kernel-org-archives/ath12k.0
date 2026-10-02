Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F0CA5FD4
	for <ath12k@archiver.kernel.org>; Fri,  2 Oct 2026 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=; b=jmZsCFRKNSaQxponeoWg4uBRBU
	XrlpAhv6Ge28zMMduJohfOSfOZFFNwHqB+4haukWL8jCZDgfKBx+VxVstjjkKEr9HPvKyg+4Dzu6o
	oLW+8rgF88SrSy99mexBlfMW4XGLlc3LOyMRI2OTgCCMrVZqt5kh7Tidow93hPdUaXJvQzoolYTB3
	/I5IHPYtAlzJiWbBCRB+C4Kz9hdSM8iR00K2hu6HW+AOl8bi0eKPzG1RnqV8fF1T/mmMcMg2PZOPy
	9qvEVY0we1zJK7D9REuxbCWJUzzCoGsZ3aoh8PXbXYuJnU4xHy2O9AHQQQVShs4airPuTHzS/F1Fb
	d0RknXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgmZ-0000000C7QT-1ztD;
	Fri, 02 Oct 2026 17:10:51 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgmX-0000000C7Pf-0NAy
	for ath12k@lists.infradead.org;
	Fri, 02 Oct 2026 17:10:50 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-344447f9c3dso4748661eec.0
        for <ath12k@lists.infradead.org>; Fri, 02 Oct 2026 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790961048; x=1791565848; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=hx6TOBe8KvDe44823HfkVn/IlcY30A0RCiD0cCIQU0YlkQbvTdoN32m1/klHtxYNNm
         iLNkiWzKMjeQ73wHnfB5sgtaAsby0NSkHsEZ5yrsktIVM4mcSpaG+dG6Iy1ZCQXs21dX
         Yf8LtgWI12pc2v+pcrFmACK2Dr27v8vZIAt8t7vsz48V+Sp0iHT3W5hfCMtQAE7tR/g0
         SCkLpIsH8bY0tpBiJz6VYdH9hl1CUidcmPWMQZjAn8I1++ml/ITInkyerPQyICpDOTWL
         Ah+sX90TaY2kY1NYBd9RJpzSH366Yu8KfwHZOKbAW7vVxqnE2sGt0rlOArjzBIJ88MnW
         tckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961048; x=1791565848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=zI0LY6tpQZMBtg299+0ZriD3aPLNk4DBNW39o/Ex9xPCSQoBdeCQ7IEC7ne4dr36iq
         DJYHEjbYQwYnozCOqvVdRC6Ppw/+jcXkU5FdHKPVdRQu5X/G5s2r+P3kf9/Za56KkAJX
         ZVhOur7V28pO6x2MHg9x+xJCmFDIa9KbNYXvAG9cAhD7xSIwXD06wK0LrmA0iAWuHs3u
         RnHwlKbS88QJ4ZdY9lu/20vcc3UHLuT0Z9TfG58Nst0rCYiHWN6f6p7H3f1kid5ANiu2
         ykBpwWO2SuzAAPO0fIQOJYbgM35ZKUOzhrZXvO/rEDa5SjfFNYrRWIkOebCsHhcy0h5C
         fqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdg9d9Ldk3sekpo1JULrqys+1iAAg65CvJSbLWqF+VrIINSkUQz6Eep9GwvvzBZxsbe6XrNTk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLmz5mvVqhoV5a/BCcU3EMkNmdtdhHUHEuFz9rn0ykK22ANpS2o
	DLwKXi8jzXdPNOM2KvCM9TraSNCIwwp7gir5vGFdngL84q++4pyk8HlVcb08JQOVN8w=
X-Gm-Gg: AYBFou3XtD6WntAq9FG5AiDp+GXuuGin91TozRB8JPp62UPNfeZvTnG7+VVybdLrtoc
	9n5IhFVS7jcJo95LiLIh95Ow1bolqW8oEY7oDPi1fRrF22qwyIHFhwv+fbrKCDjoXt6Q9hmdugg
	bZGpGpEE0+3vdA/0riUK7gMvYj7p+llclBQFGTvnYD20q+uhGiJFHlmZ8doFPTWEoG3U2p4F6a4
	Ej8RANWpXWX8O8cntYbtDSpSYcyQ6XzPGbYaBmjbCR7RrnZjPeyCJs8dF81YFkPXxqPuRz1i2jy
	eANDyyQiVzfZrX0lsYYupY6IUYtkzL0l6/3QwRiccgU4vy3yOWzcNA7r7/4RcAX8jALAOmzSd6Z
	G4deaxlF4mgT+yM7r8j1wf/J1Mf456Q8EWpGpIRs0lWcFuP7B5l0tHRPtGF4gN7ETH0w1vp01J7
	fUW09Z2kE9hi5Zljr00UEmu3HoLpCOvXwJA8RDTTWsZay4
X-Received: by 2002:a05:7300:e5c2:b0:34b:b410:9352 with SMTP id 5a478bee46e88-34f14f18c8cmr3725477eec.1.1790961048034;
        Fri, 02 Oct 2026 10:10:48 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm4509703eec.11.2026.10.02.10.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCgmU-00000000BiY-09Yw;
	Fri, 02 Oct 2026 14:10:46 -0300
Date: Fri, 2 Oct 2026 14:10:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Message-ID: <20261002171046.GA32083@ziepe.ca>
References: <20260930151229.GR163130@ziepe.ca>
 <20261001071945.83116-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001071945.83116-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_101049_130404_47AA8ADD 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, Oct 01, 2026 at 09:19:45AM +0200, Jose Ignacio Tornos Martinez wrote:

> Regarding platform_device_msi_init_and_alloc_irqs(), I agree that
> moving the driver to device MSI domains would be cleaner on the
> driver side. However, even with that change, I think the VM problem
> remains exactly the same: the device MSI domain in the VM would
> allocate virtual addr/data pairs, and the firmware's private interrupt
> controller still needs the physical host values.

Yes, I'm not saying it fixes the problem..

> Also, the VFIO variant driver scheme would not fully break if the
> driver moved to device MSI domains. The variant driver caches host
> MSI values from the MSI descriptor, regardless of the allocation
> method. The hook point may need adaptation, but the fundamental
> approach (host caches physical values, VM reads them) remains valid.

It breaks because VFIO will only cache *actual* MSI-X table entries,
it does not have visibility into anything that
platform_device_msi_init_and_alloc_irqs()

The only reason this works for you at all is because the driver
hackily copies the vectors from the real MSI-X table so it can look in
the "cache" to find their true physical versions.

Which is my general objection, I would like to see the driver to use
platform_device_msi_init_and_alloc_irqs() and don't want to get stuck
unable to do that because it would break this.

> Regarding the hypercall idea for device MSI domains, I think that
> would be an interesting direction worth exploring as a generic
> solution, but that's a multi-subsystem effort that will take time to
> design and land.

Yes, but it does actually solve the problem in all its forms..

> I completely agree that this could theoretically affect any device
> with private MSI registers. However, in practice, I'm only aware of
> this specific behavior in Qualcomm ath11k/ath12k firmware, where the
> device's interrupt controller requires the host physical MSI
> addresses to be programmed directly. 

Everyone else seems to know this stuff doesn't work for
virtualization and doesn't try to do something like that.

> It's also worth noting that the PCI reset support for these devices
> has already landed in linux-next (commit 290153d46d1a "PCI: Add
> device-specific reset for Qualcomm devices") [1], solving the
> device reset path for VFIO passthrough. This MSI series is the
> remaining piece, with both in place, these Qualcomm WiFi devices
> would be fully operational in VMs for the first time.

Why do people care so much about this? I always thought it was a bit
odd?

Jason

