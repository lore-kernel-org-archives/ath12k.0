Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF9FC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O70IzUOVgHEP48/yIwhPaJQer5C5JXDJ5C0xc+7HOc4=; b=vW9KLrtMnqpxsWyLiw758KLRR8
	fqV7VAhmrumFJcfubahnLrfY8VWp1C1E2Zc8Emw0c856j3taAUi8Ot2g1u50uV1vfNFJUIbAWsFie
	OX/pEq4GHPW4DK6n6nbpR3AU33aPOSnUNlKBZlNkSd0UDsibsWTWbaXBuAxU/chEMqOKCPdEh16qX
	vK+khIMYxtmYITUIWytUjAHJLbPmdSC3xdmS+8O0OBFjFNpyJhPwK116D8dnXUMUu5eHuYEzxzahB
	kXrlMRa1d/PMxGk5MWFc/neLbuRRHZImC7em+o15hOaG9Xi9kdWktNaEwWUMzY5zLv3pvNW3SstIU
	84FbV/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7FL-0000000Dzn3-3l8M;
	Mon, 29 Jun 2026 08:21:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7FJ-0000000DzmZ-1CiS
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 08:21:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-472493849a3so1061951f8f.2
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721295; x=1783326095; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O70IzUOVgHEP48/yIwhPaJQer5C5JXDJ5C0xc+7HOc4=;
        b=C5XDV7zMWAdXQovLHfmmhSnFja0XjEwGTiVyLCr3wolbUBvWJOYJYWFnvgFenoW1i0
         Oj0r0swn7SlcG52laHBp8rh8Myttc4wFcc5W5l4GNkSwmQa1mZQXaT+ISsHu8V8NqU+E
         D5cwnld1iaTyBkIMXOZmV/86kdH2xdHtQut+T7DHXxzxXL9P16PTTBN3dmyC2xh3xsZc
         H6qwzXqMVoSj7yahwkGPXO50LpqfhHwqtTdHhc26CnCFNEXKWthSfWANwZ21FdYdZOhJ
         fB885o2DNwp+qYMRWVrnnPHnXgJSXcOsSdHpmPAa7xHRNdKrK2pt9gKsF6W22FDkkLAR
         xKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721295; x=1783326095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O70IzUOVgHEP48/yIwhPaJQer5C5JXDJ5C0xc+7HOc4=;
        b=fLfJmS8j4yGs/Jj2d7Hcz37ZOIVoCai+9WMJVPyXncYKmKpwaxW/BLtEdLE5hQyLom
         bkAZt4WI1dMAtEXLwtkDrIobSRMYAzv9s+oUBORJlg4zUFwf7EnUyC4V7qw8Hg/7Nzfe
         APCXGHIzF+dyrDFbA1aMYnvqLMLOy6FI59VWSnnktgnYiBZV7Pv8XU4oQBbXJQsThVmj
         ZPTyK8we9JYT4H6M9FxrdA5ozbxT1Yd9BDVu3djlfrQoe4llfin3rzN7p3aFyC4B3sdx
         CL047WLzK6Gg31pQ7CgtP96FRCp4Aw62MLwsQeqB+Dc4KBIzeBzpi6Y0SNyfZklLcy5d
         f3iQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9y5VluwcwL+buFkxZFYYpy35ooOlZhSSiTApnvmddE6lEHAiv8i1EAPw7Yov/H8ub6zDlIaA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcaUBtTSkyGsJ7DNNVUvlMpw9b7yXh1hld5kglgS+dNZxW5mTa
	bmhRVgLNKygpBacMsR30boOVK0dozZI2aRnIAEQPoLBd/n+7te6vkOPQ
X-Gm-Gg: AfdE7cnj8tCpA1SyULqiDHIcW4WFi3YCuLRsvU/dA8Ajq5GoxLfjCdb8bl0HxC/EUxo
	Pvfdss0+Dsu1xSuXoE/ElFAYfCS+GiyOvPmktLKmTmpMR37AyZXiDaHAD4OOk3ogNFxiNlxsyDk
	MckuGeuW+VMFlozeQOiGnEtxS57oXYyuMDwQOtbmEs2MCUhmsk481MenmOBnObltBiGaG13+cCO
	f+Mnlfvqaqz8pikz2Il/tog6/M1SN6sgMMo246qLGjP5Q1xxGu29WcPqIT+jcp0Yyx4h32GRVVY
	BsK7JA1jQrqdcRcQF/9udMV9xKzRHWksQUEt45oGE34gcyd2tgzRxDQYZ/AW8zJVKTIuxUtV6BY
	W5VrQI8x9Elukpq4YCZQ5WehM1Wq/OziachIiZmb2DUMZ2B8XKgkzJp0ntYEPVOdki6U9l7JYFy
	wKKqbFXp5MmxKoemMtau3LjNVsCZHzOj7Ni9y11z+OON3G8BUJe3o7R/hgWp1dgmKp0ffsAi+BS
	zvTSkrPvggFRUHY
X-Received: by 2002:a05:6000:2086:b0:471:9fd4:743 with SMTP id ffacd0b85a97d-4719fe34b54mr10424948f8f.45.1782721294866;
        Mon, 29 Jun 2026 01:21:34 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fccca2781sm23118806f8f.6.2026.06.29.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:21:34 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:21:33 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from
 device tree
Message-ID: <rh6uz6bqetobowyrist7hhytdu32v2azvuambenyzofur3tjyj@wghfgwtmjj53>
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
 <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
 <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
 <3B9D1FBE-37D0-4902-8C0C-8AB57C1310A5@gmail.com>
 <23fr45actdrqt6rp6fozcaugyk3egs5zm7imschl7gyuuj6cme@3pvdhqv7xvkq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23fr45actdrqt6rp6fozcaugyk3egs5zm7imschl7gyuuj6cme@3pvdhqv7xvkq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_012137_383706_70425210 
X-CRM114-Status: GOOD (  28.81  )
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

On Mon, Jun 15, 2026 at 03:36:50PM +0200, Ernest Van Hoecke wrote:
> On Wed, May 27, 2026 at 05:01:51PM -0400, Andrew LaMarche wrote:
> > Ack on the deprecation of qcom,ath12k-calibration-variant in favor of the
> > generic qcom,calibration-variant. 
> > 
> > However, drivers/net/wireless/ath/ath12k/core.c still misses the logic to 
> > actually load in the BDF, which this patch also accomplishes. I don’t see that
> > in the Qualcomm-authored series you linked. Perhaps a v2 to address this?
> > 
> > Andrew
> > 
> > > On May 27, 2026, at 3:52 PM, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> > > 
> > > On 5/27/2026 9:12 AM, Andrew LaMarche wrote:
> > >> Hi,
> > >> 
> > >> A kind ping here. I’m not sure why this functionality is missing in the first place, but it is needed for loading caldata from the device tree.
> > > 
> > > Your patch duplicates functionality in the Qualcomm authored series:
> > > https://msgid.link/20250228184214.337119-1-quic_rajkbhag@quicinc.com
> > > 
> > > And note the upstream device bindings for ath10k and ath11k only support the
> > > generic binding qcom,calibration-variant.
> > > 
> > > There are no longer any generation-specific bindings, see:
> > > https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org
> > > 
> > > /jeff
> > 
> 
> Hi Jeff,
> Hi Andrew,
> 
> We also need this functionality, and as Andrew noted, the patch series
> from Qualcomm does not actually address this.
> 
> I believe some confusion arose because the patch series mentions the
> "qcom,calibration-variant" DT property, but it does nothing to implement
> this in the driver. In that series it only exists within a schema file:
> Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
> 
> Our need for this property was previously discussed here, and for now I
> don't see a way forward without it:
> https://lore.kernel.org/all/77vowy4ax4cl6dlc45i2q3fjmwn3q676wqghq267tmbix7773b@27h5t66mflur/
> 
> Thanks a lot for your work here.
> 
> Best regards,
> Ernest
> 

Hi Andrew,

Are you planning to send a v2 of this?

If not, I'm considering sending a version of this with the
qcom,calibration-variant binding to move this forward.

Thanks for your work here!

Kind regards,
Ernest


