Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EC5E7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnBR/YWTurV9m53qLQ6/z2RjhLEdFZVkgtiiQQ9H7XM=; b=uJy1eBpevjKyrj+xv6AYJCuAg+
	Z+5qQB6HnEV9KE+hfZMQ8fo2noU99YwnbXSP62NJtj/o1zNVU/UYMSdNZEyUVqT/Ctns1z6rwZzIr
	fvc+hHxI5BhH+wXDynU+24ZANXPulQZ0CPL3PvlcQxo7ce/ZhXYTJYqzu1Yth++bnefyJ3JKqPB5c
	fd8r6laSPTTziQOEVp9EdPrUYr4CG44jhN3oxY/yWnNCxWz5S1PUxxvTgUoQR+kJ8ZZcAjDlREhUv
	hOYEm3xwOwKEJRAQHJGe2Wv0fcvYbviR+4gzdXSzSzXpV+1BGus7xyMVf5keVqwHUT7OZH+fb79F4
	Ffx1RPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLITF-0000000EI6R-3HGT
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 08:53:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLISV-0000000EHxh-2uvc
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 08:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 949D55C4448;
	Wed, 11 Dec 2024 08:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C6FC4CED2;
	Wed, 11 Dec 2024 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733907158;
	bh=EWCFqp/kWK73aZA9KQp5JhGFxDPQj2mhNnR6ifLue9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfAYVRpCrBwT9D74sGx1D/qJMrWZDdCjn1so3fnLz3eyWmXD4fcwn4j2jj3NPXQwX
	 fpgRRHR1jgFgWfd55OHnSYAs4KeCEfmr3VmkuZOuQkD3wUpW9SKlFBkCa//rXj+Hbe
	 NhWO8I6xKI08PkKx6fDxLqmALX8fVyOfidAcgxBtuYoIkxvXj1Lmg0wdCgRXvcGqzW
	 KBnZBgddL7dJkmSgfZPJPQ/HBb/TUSmJ1SY57Nk7W3mkeshpgNrMWiqK829Zt/FZDe
	 RS2cx7OkVPXNHzaCkUd4wN9wRxJ8CxNEQXZkaxVRFHCB8gmYrhBq9DkmIlBMX4fJpq
	 fOg8gDfInPTrw==
Date: Wed, 11 Dec 2024 09:52:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 07/13] wifi: ath12k: add support for fixed QMI
 firmware memory
Message-ID: <7qypvfjb34nyvcqmdw37zjpcxga5drvddwimlc3cuhejtyzjnz@4agqjdalxl7x>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
 <20241210074159.2637933-8-quic_rajkbhag@quicinc.com>
 <2d86b600-a7b1-4f7f-87ba-c167ec8c0405@kernel.org>
 <ab745c8c-421d-42de-aec7-54c2064cee58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab745c8c-421d-42de-aec7-54c2064cee58@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_005239_782939_316EC254 
X-CRM114-Status: GOOD (  14.91  )
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

On Tue, Dec 10, 2024 at 10:30:54PM +0530, Raj Kumar Bhagat wrote:
> On 12/10/2024 8:13 PM, Krzysztof Kozlowski wrote:
> > On 10/12/2024 08:41, Raj Kumar Bhagat wrote:
> >> +		case CALDB_MEM_REGION_TYPE:
> >> +			/* Cold boot calibration is not enabled in Ath12k. Hence,
> >> +			 * assign paddr = 0.
> >> +			 * Once cold boot calibration is enabled add support to
> >> +			 * assign reserved memory from DT.
> >> +			 */
> >> +			ab->qmi.target_mem[idx].paddr = 0;
> >> +			ab->qmi.target_mem[idx].v.ioaddr = NULL;
> >> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
> >> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
> >> +			idx++;
> >> +			break;
> >> +		case M3_DUMP_REGION_TYPE:
> >> +			dev_node = of_find_node_by_name(NULL, "m3_dump");
> > 
> > NAK
> > 
> > That's neither correct name nor documented in the bindings. You created
> > now undocumented ABI. Even with incorrect name. :/
> > 
> 
> Most of the Device Tree related concern in this series are from the
> undocumented ABIs and wrong naming (use of '_' instead of '-'):
> "m3_dump" and "mlo_global_mem_0".
> 
> To address the undocumented ABIs, "memory-region" and "memory-region-names"
> should be used to reference all the reserved memory required. This should
> include "m3_dump" and "mlo_global_mem_0" memory region.

You already use them, so this code here and explanation is confusing.

> 
> If the above approach valid to address undocumented ABIs?

Dunno. Change all node names, run dtbs_check. Do you see errors? Now run
your driver. Does it work correctly? If yes, then ABI seems documented.
If not, ABI is not documented.

Best regards,
Krzysztof


