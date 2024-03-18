Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FAAC54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGH2Xcdh/WPNCnVMfl6T6hbGlhU650ZY9bYU4MAIGtQ=; b=TbHmBU1wEyCSiM7H325ftOJyuU
	5ujSID4NUxMdgJ/2PszQwXhbpIKBvz0l9fbVS8UCMN62grEzEHBaKOq6EapPSbyig9yXvhjdzS2Qd
	6PCql3T1IRwZdtIYDzt/Gx2PAp8hNpkg+gVsVHPfwagpc9cRAPe11wanrOvFaO/MZBcAxiyuuvTxX
	gBu+ztCrig9fCRuFnRjZpH+PZxNJ5xfYrOJYg1AsOR3iFIbMNAYmODDz+KSvHq0gjJJmlhSeFRcqG
	ua9PHzOIR6TXH8ugbe8egPoBQIsgMCxijob+VCevpOD1NlNDQVgAJUnXy9hCdZxjreylWXX4Gw/dK
	Toj42i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFPy-000000098aW-2BZJ
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 16:00:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFPv-000000098ZH-2zR7
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 16:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C560D60C28;
	Mon, 18 Mar 2024 16:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EEBC433C7;
	Mon, 18 Mar 2024 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710777650;
	bh=xGH2Xcdh/WPNCnVMfl6T6hbGlhU650ZY9bYU4MAIGtQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=i0aHdfy5lPvRbM9LcQPhtTjnl/wsWaYB9hhclOnUi7L54owHoTQatMXeS7vcA+D8s
	 ZnfETn3dBXOzSriKNFlYzpe3/uF8+pgDdmw8kr4TL75yRhVXZ+dLa6Yl3FpKgSkdj1
	 fuK6NIzPx85pF5z6Xf8axCMouN+ZbLE0wc17sQ5DuRd6eLSLUhweloGsW5qCaSDmyW
	 SVIc1MWcCHrYz2USl1WVg+ed2z21MBPXHFBtCPYXYeVB8NqVt54PaTqLupGBldA/k/
	 gd9FnBCflP6+GiG0tbhIHlEi98wkieGLKB08ruFWr//QfEU31Mjg4EjyWZcDXTLo9W
	 IlbIVQEuNnQWA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Vladimir Mesh. <owen.mesh@gmail.com>,  <ath12k@lists.infradead.org>,
  Jeff Johnson <jjohnson@kernel.org>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: Re: ath12k: driver does not allow the system to switch to
 suspend/sleep mode
References: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
	<9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com>
Date: Mon, 18 Mar 2024 18:00:47 +0200
In-Reply-To: <9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com> (Jeff
	Johnson's message of "Mon, 18 Mar 2024 08:51:04 -0700")
Message-ID: <87le6fcyxc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_090051_822360_40FD4588 
X-CRM114-Status: GOOD (  10.04  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/18/2024 5:15 AM, Vladimir Mesh. wrote:
>> Dear Sirs,=C2=A0
>>=20
>> I have a problem using ath12k driver with wcn7850=C2=A0adapters.
>> ath12k driver does not allow the system to switch to suspend/sleep mode.
>> Please fix it!=C2=A0
>
> This is a known issue both for ath11k and ath12k
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214649
>
> There is already a proposed fix for ath11k that requires changes to other
> components (MHI & QRTR) that is pending approval from those maintainers:
> https://lore.kernel.org/ath11k/20240305021320.3367-1-quic_bqiang@quicinc.=
com/
>
> Once that is in place, ath12k can also be addressed.

BTW it would be good to submit corresponding ath12k patches as well.
That way people could test them and provide feedback.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

