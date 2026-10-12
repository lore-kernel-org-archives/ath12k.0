Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D01CA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=; b=Ypz73jrybQMjRMNbr1rstXPdoH
	9XkboK/SohwYKAECTvmLLCmbZMM5onZYA+aBE6xba962rTsmjs2YuEQUiPXjt8WXnpuS5Vo71v+4P
	Y1Ropt0Hv64tyMUznGG+RNa93WGUHdK+8AaPn+FNsqP7Kz477liLR63q8vaoWMa0XiGC6gHtQ5OQ/
	VoRaf57BxcQu/S7BBKGYQ1kk+Q7c29U1nHiXW1E3RDRoYBAX9Ke7uWcPZaEoMu9mG5joINxXZD7+C
	g7WAAxum+PQfH4KZ0K2rSINqYPm0lto4Zuy5/rmNmCRmhdls0cPD4o98aioFjfjAva7ju+Wh961Od
	aT946CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKU-0000000AirH-2lQ5;
	Mon, 12 Oct 2026 14:48:42 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKQ-0000000Aiqa-1YTx
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 14:48:39 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5337fb43c16so22311051cf.3
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816517; x=1792421317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=QpFNtrk/2VJ2DfBEghabrH/LyCr16ut837jjN4sN/hEogBgypPkQ4/Y6kYHtWVANpt
         REq7nExSzlmuP8zm6BrSIjdsqOzcYAX42F0aJsm8Mm7jLVT5sxGkzCZMmdZ29MdIcThb
         DDKbLss3pv5pOVXs8DO+Mnlz+mNdk0jpv+29/KHwNXkh74jAONGGX7u1tK8dlBOYAJ2w
         6kAzvajLAay5qGPV5mHEYOiHViULpAtQy5331aFPAQKQRaBK+UaVDHjbSVdx68Kanp2u
         CE4xrqmXJDbvwPfYRAloYTbsQ1aRYPCpSVmfcFYZfB0m1dtOHjlWTZVEx/sE7sOBgKlP
         GSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816517; x=1792421317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=ZFsywVsjZlyq8PA1eBPIEVZQqHltR6LB+nJglhadVXrqmCW+zNtFhvVKQjcZy/Qh3r
         S0zWYwqNRsNL8M+xfAJKA0OVtnu8K32lQwhYu/+K2KYcy31J+y1TV0NlmJDhaSzHKvxd
         ZFZEhQ2K6tVvUG41dMZf+nGj4bFUwTyosDxtZbO8kvMIXZuXlDLiYnAiIlpulkHFL17g
         /rd+VkjagO31YkaIWRLA6qvSKhjIvA67/Wbj1u23l7RsygC8VAbt2sJOdKMo/JkYNrIo
         d+e6+F4WLGTiGZYrfOxc322HXyUyBq3miE7x1aUgXpLmBU05nZXDARUEC/b5uWVZ3qoe
         iaaw==
X-Forwarded-Encrypted: i=1; AKwUvBwPBNq/k3UqCuVpkfuOTfvhsqxYe3rR0rfrtmRKuBp0lggZePE2j68C97csxqWhPCtDtdAuPjQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKJU3BRaIEtzlGksw6nQUuv09r1Fke6V1Fg3fsFw9jUqxxAR1yl
	R3Yqot825LasID3c/+YefzBmyoIsiacxndtv5lgdGNUUfMOzgI0uL7e+/eeiMNcWxAQ=
X-Gm-Gg: AYBFou1XI7oGDKHRykESolAE5hP8mbVp5RtDuuiggE1GdQY38Z9ohqdANRHm/yqxOSx
	XYRcl5soLV0/sIsht5qIRgTgN6zC3m9idCz8ItTrBvspNXq58Uv4UvxWR4es7TLrc7s3gq/nGoY
	bNkMNWoPuCMR9lWnNz18gc9JyAC/pJIbFnM42r4zfLSGXQJyaNwNMUq2HyymAv/OOECMT7PkAg5
	lkULifyURI6GGNFNQ3ukL5vupFcwaOqGJ+vo4Ne6bbDfaTkpGja/8S8+ySe0gVovIdhNvlZY6/U
	SZnLMVCUQYIBjCsdMqiSO2+vlLtqGFBN/Otgu5FyO2WvXL00NkYWGdneQhzy7cG1Hk3A/eVT4xc
	YYzSQDWenyKJjj/CdJ91FnSOrC15y3nJg31E1crcWlxN5Sb0TkulDGWqgEtF8JmBhWeKk6mvZZ9
	w8tXa14d0FxP2vL1k5v4ZJbAqOMo0K1UJlgkmrtopjpnwr7sR0NUts2hs2ato7iLlYDGfhwnWP7
	jPf/E2z+F6Otp7Is+3f5EeGCD0Qg1tHeysqkKvQYA==
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr175097251cf.8.1791816516771;
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa173sm80625631cf.7.2026.10.12.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHKN-00000006Snm-0vE4;
	Mon, 12 Oct 2026 11:48:35 -0300
Date: Mon, 12 Oct 2026 11:48:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261012144835.GG14213@ziepe.ca>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_074838_438381_D465E122 
X-CRM114-Status: UNSURE (   8.12  )
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

On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:

> Thank you for providing this level of detail in your cover letter. I've raised
> this issue with the engineering team in the past, but I've once again raised
> the issue with your in-depth analysis.

The main issue here is the driver can't use a normal MSI-X in the
normal MSI-X table.

"private" MSI registers don't work for virtualization.

Jason

