Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CF9FA1FDC
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4/X37XCFva5OVnePm1MhKl37TKCmccKP8OvCY5aZo8=; b=UFxzjEw+/S36Fn/+GDW5Wi7fON
	g/XyEdQfnP3WufyBqpP+sTXnDlHuOlcIkkX5597jeAShZSOLUtyuFggzkSgTzSEREf5BSWCDGwpLZ
	/HJKz6ZOiWSWk7GmQc6HDBixxHrO3IW8SDMGNPjOr7EH4rcMZ5vUrAZYwBZUcBdnY/0k8yqpzN/h/
	paT8FHppALWVgmA5d4jPGWAx0fZvewetccs2BGNBArRj3xwlIeRLTN82NBC8WF9BE50R0/rn1+c0O
	ZFeWS5nN2OTZ3x9JmLSWaHysilH+sv1oWbm36Km3tKsPup5NoMq+XoY7bkV1KTe7I3d1bVnrg3u94
	ph8tseSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcKs-0000000AdN4-38Gd;
	Wed, 22 Apr 2026 18:30:06 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcKp-0000000AdMi-0vud
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 18:30:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so2912961b3a.2
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 11:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776882602; cv=none;
        d=google.com; s=arc-20240605;
        b=HMjAhEaR2ZndLusYm2H903H3bFN1CcaPTwxyxlvFTdgGR6K8B//JcXZoEsxTGRmQl2
         XMELNMuY3iEUrJclza0XxN+tASJXJSd0hflNhw5CydJeAn8IAgRFRCZm924I6GlYH8T4
         rDu74THHzR4UDzBW+r6iMKN2xsS6EpX2gn+9g4sfzULjalOGLwr4ZPCoPfjWhZpGJLvD
         h+dn4/19xE6xGB7/TmOHCW0tUaWRo8YrWLvlzVVgpSkvBHArSyzVa0MXwkpkIMQWOwVq
         R8XegFcNQsFQldrYLvncJsC1eccdcHm2/3fzUf1jWcA21l5Jkov1wn4jo7Rd7cTO5cSD
         I7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4/X37XCFva5OVnePm1MhKl37TKCmccKP8OvCY5aZo8=;
        fh=OvBj0vCRMSfnplhg1xxrTTPW/tORzRPORzqyvoYCWhI=;
        b=RXzz5Cql/V4sMcyQJdYk0xUia/gKJ2Ay5E9ME5o5+rcrnlLtIGUoZjK/68sMojlTVa
         zv0CSdAWFNv4kOasbzwasXky3aY+omx2/n303W8VVQlZbfOgJLD39tuHspqjm6r+uF56
         e/bxHXDbBLcUF3jtC5NKw32cGx76Z8oWSjAFYJXO1N6ZFIf43wKz8hCA5crQDgavkz1r
         syilGPmtojn2R0xL2V6SoxeHykDb6YedPYF1rhkaNI5w5JbqA0B2EQonUJbvCacVaEBw
         V8pUp12g2VF/87NEhOW+PbetM3j1C1gt4M8Ja4FVPCzYsUoalT2Fk+0Qju40VZZeWCxD
         D0Ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776882602; x=1777487402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4/X37XCFva5OVnePm1MhKl37TKCmccKP8OvCY5aZo8=;
        b=dgWW71OFcxl15KAo/gz3n/MPs4WwpfHZTcjx723HS2WvrLkNHEPMUZCzvEKfFKFW+P
         msJ2fbVgtmRdv1uNkrA2A1gCs0s2YTk9W90OFQx1IsnFDlSKZRME6cCyQFi9tZtDZqyT
         3BPsa2QNzimJfqTN7F9psbe1fTUWwB/dTBmkiBnilEZfq8BNcGoJYCXBFMjOwa7BNVDy
         EHwhgUTjSKkrqZ6E7wo/0IaU/Y4Cbzbyz3CgIInGIeGFhgiXOVmmLBP5aU2TYFt+Whf3
         vAJ+4Za7b/xa9t7JOptWqDji7x+WxGn4JvQzaNIJ0Z6bR3mnAme0AKiQOrLz8jS7iKaX
         BNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882602; x=1777487402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4/X37XCFva5OVnePm1MhKl37TKCmccKP8OvCY5aZo8=;
        b=UDcffEgVg/sC+8qhjsoNfdwWCpTQwb6bSHtjAXmSRnbUUASz9BWz3FBY3Qat+hJ2kO
         geEk6zt8yGR6vtR8RWAJQE0RyIYDAoaR3qVeIpmDbHXwFGo2FrWZIwSd1tzcPFki0HoH
         SmTxQfgzYHTkBz5biiSCdIzk23ZJ+nwdbx7Plspmvj9jU/7ghjfsNlJsZjSKLFHa1zHY
         JeGovR+xueJMnevdn4mhnSA6wM1P/r52NrhhHHKJgiDjyBeZ3gTb90wcYsR/YZ4nm5pO
         d2yt5w0WP+PEwPKP0xY0gFQzTKccFarE4vJ0oSpT3WTcDkYH048saRsBp9Ysqd6zMPxY
         /stA==
X-Forwarded-Encrypted: i=1; AFNElJ85CtEaUQPdt+VWoifqI0avuRACpSH7PA5Sn9slc6hlmlGPFFfy0+YgM8KmoSwURkIm4cdiOzY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyTKY08n9rd8g4X8UibC+yjQ0f7vdDm8dyZqSRTgqafLkPVq4a
	v/uIGby/8aJUUHS1YV31lMpMeoDJ/GDtMdKjMenADQ2i8OewXQlBBw0ELwMsPmq4iLvc+jgKl9j
	AjjpDWABxXIkSRQGx/IE/6VSveG1EoyM=
X-Gm-Gg: AeBDievm7uDJrTRy0agql6SvhYrxfh9T+WrJuZ/SYCCCHfQonweONASIfgrZu1Pkx96
	e0BrKkfQaS01zX3EpRJYE6tsIIffQmbWohQBueV2q3lAcsTM37rZMjbll5mwX90D5QggrVYqvAy
	e5N2vdRkO63Lo0/jHLTsNUnpJtZxxEnd2NJdCfkbckroFYygWri3fTiazHSaIcM4KcKMxfDSYsQ
	7N8PQjaPVl4WVf+i0QBZM4fMV8XTaQ53n44jFmIpyTxgGerwE2xTkV5BhI92+omm4stmrqLGovZ
	NFM+VhOjsemUha7M7XNCa4kc7BI=
X-Received: by 2002:a05:6a00:3c86:b0:81f:40e5:34c2 with SMTP id
 d2e1a72fcca58-82f8c8bee9dmr24460114b3a.32.1776882602100; Wed, 22 Apr 2026
 11:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com> <a396cf77-81ff-45a7-ae62-fb4e22c18497@oss.qualcomm.com>
 <5209fd4c-eee3-46ed-b731-1e822a04b03b@oss.qualcomm.com>
In-Reply-To: <5209fd4c-eee3-46ed-b731-1e822a04b03b@oss.qualcomm.com>
From: =?UTF-8?B?5pu+5pix57+U?= <asas1asas200@gmail.com>
Date: Thu, 23 Apr 2026 02:29:49 +0800
X-Gm-Features: AQROBzDxM0fqbCHkhOTTojJKKrEQPg26v2Vc1sqEZ8FbcRGZeJNS3g34dPnWJWI
Message-ID: <CAJo1PWGuSk4te+XVPn2cxqHpc1RfBfZbeKbtXm=8OZQ=rf_wpA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on PREEMPT_RT
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Rameshkumar Sundaram <quic_ramess@quicinc.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_113003_271866_700D1BC6 
X-CRM114-Status: GOOD (  24.27  )
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

On Wed, Apr 22, 2026 at 06:33:45 -0700, Jeff Johnson wrote:
> Amended patch in my pending branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=3Dp=
ending&id=3D32f70ee38388bb9089b9cffa9791f5ef8d5d32cd

Thanks for picking it up and fixing the Tested-on placement.

Sebastian pointed out on v2 that the fix should use
lockdep_assert_in_rcu_read_lock() rather than RCU_LOCKDEP_WARN(),
since the former is gated on CONFIG_PROVE_RCU (same effect) but
expresses the intent more precisely. He also noted that the bug
is not PREEMPT_RT specific but applies to preemptible RCU in
general.

I've sent v3 addressing both points:
https://lore.kernel.org/ath12k/20260422180814.1938317-1-asas1asas200@gmail.=
com/

Let me know if you'd like me to do anything further.

Thanks,
Yu-Hsiang


Jeff Johnson <jeff.johnson@oss.qualcomm.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=
=8822=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:33=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On 4/21/2026 2:27 PM, Jeff Johnson wrote:
> > On 4/21/2026 10:25 AM, Yu-Hsiang Tseng wrote:
> >> Two functions in ath12k assert that the caller holds an RCU read lock:
> >> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use=
:
> >>
> >>     WARN_ON(!rcu_read_lock_any_held());
> >>
> >> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=3Dn, this produces a
> >> false positive splat whenever these functions are invoked from paths
> >> that do hold the RCU read lock (e.g. firmware stats processing or
> >> mac80211 interface iteration).
> >>
> >> Root cause:
> >>
> >>   - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
> >>     returns !preemptible() as a proxy for "in an RCU read section".
> >>
> >>   - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
> >>     task can therefore be preemptible while legitimately holding an
> >>     RCU read lock.
> >>
> >>   - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)(=
))
> >>     and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
> >>     read lock, so these warnings are incorrect.
> >>
> >> Typical splat seen on a WCN7850 station with periodic fw stats
> >> processing:
> >>
> >>   WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
> >>     ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
> >>   Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
> >>   Call Trace:
> >>    ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
> >>    ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
> >>    ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
> >>    ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
> >>    ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
> >>    ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
> >>    ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]
> >>
> >> Replace the WARN_ON() with RCU_LOCKDEP_WARN(), which is gated on
> >> debug_lockdep_rcu_enabled() and therefore compiles out entirely
> >> when PROVE_RCU is disabled. PROVE_RCU kernels continue to get the
> >> full lockdep-based check.
> >>
> >> Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO=
 handling")
> >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-1.115823.3
> >
> > Note that Tested-on: is not a official upstream tag, it is an ath-speci=
fic
> > tag. Since it is not an official tag, it should be specified separately=
 from
> > the official tags:
> >
> > <commit text>
> > <blank line>
> > Tested-on: ...
> > <blank line>
> > <official upstream tags>
> > Signed-off-by: ...
> >
> > Unless there are are other review comments there is no need to send a v=
3 to
> > address this -- I can make this change when I pick up the patch.
> Amended patch in my pending branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=3Dp=
ending&id=3D32f70ee38388bb9089b9cffa9791f5ef8d5d32cd

