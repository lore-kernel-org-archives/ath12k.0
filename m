Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B913BC79F99
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 20:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RdQFiUE33EDsD78iBpv3X2WHj0naDPFNR/+MtVWABOM=; b=taK97FpGMfnPjrq24DCVP+WaC/
	9A7XJBZS2+4+sxuu/miiUMv+kgEyVAJ4jE2c6+AWUnByPTO5iZJ20hoRDY/2EageQN3SpkdJ4kfAr
	qvxjic0rS0PrWHyESsxwMFhurXYH9bjoHtJ0OhUW1cLliFUXvFN320qQeydi8nr8BO3i4dPqv7sK8
	8JVl/wERnaGTUFPHAfOhco2+BPZXZc+A+zwzlbN3j7UzYspm8tG+b2DsbC3UNSTpvn40s9xzXKGez
	4UIOer50MTHF3eOflUqVbmhaP3WCJKBZAXMOzUuOh3+c6Q73/FuId8BXEl0+A1VCoNDi0jSQN2GA6
	aavW6Bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42RS-0000000ABzZ-1jYs;
	Tue, 08 Sep 2026 20:29:18 +0000
Received: from sender5-op-o10.zoho.com ([165.173.182.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42RP-0000000AByi-1bnO
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 20:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788899353; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRjKUYNDuHLJxjlQBfEVPDFX9oFrxkJhlyZLUClIaON9pMCcFi1xiITKXM8oAj0m/8AU+P20iZis1vfAbDbx0a964ZNELYsB803cqiCOBT3+ZgcddhWB8XlP4IoV0/ciDfTuHsGN9eSQ7PJZWg8mOw7oPVx/uQGXmxNJSt7yXOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788899353; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=RdQFiUE33EDsD78iBpv3X2WHj0naDPFNR/+MtVWABOM=; 
	b=ILG4tyyFps4+qrmqlZQAFvOpoJiTSx4lY3/cQDg3hNKCCVvhZdgnMNYBnU9tEQSEFxNarvlRVkCp6IGxqWz0eHqSsI+jQ5rVfnI1EL9jVYglTaqkoBU2gmmgMMfpvl1M3usJgWCYIoxQgMWE4CunkLIfQ3LGF0ZyjoMbn6sSMR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=froggi.es;
	spf=pass  smtp.mailfrom=misyl@froggi.es;
	dmarc=pass header.from=<misyl@froggi.es>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788899353;
	s=mail; d=froggi.es; i=misyl@froggi.es;
	h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=RdQFiUE33EDsD78iBpv3X2WHj0naDPFNR/+MtVWABOM=;
	b=G9G/MwdhG0qvYRWUK4/0eejG+U5A76VnOuATtEMzJ419OZxxsqROWSoQg/XDU81L
	zYEvYfQP+F3PChIcN7fnKoojoxFikho8iqMXsqOkeHqpzaTV0SeRTKaQF1wx5q5R6ml
	igM7yjIsTprcZAhbHKlOnywHS4Bo4VSF/gkGQaMc=
Received: by mx.zohomail.com with SMTPS id 178889935264592.60082194966958;
	Tue, 8 Sep 2026 13:29:12 -0700 (PDT)
Message-ID: <ff1491f5-2e5e-42d9-baf6-0f18d60b9565@froggi.es>
Date: Tue, 8 Sep 2026 21:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath12k@lists.infradead.org
From: Autumn Ashton <misyl@froggi.es>
Subject: qcc2072: board file for Asus Zenbook A16 (UX3607OA)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_132915_475841_B950F10B 
X-CRM114-Status: UNSURE (   4.35  )
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

Hello all!


I made an issue here on the Kernel BugZilla about missing firmware for a 
laptop of mine, the  Asus Zenbook A16 (UX3607OA):

https://bugzilla.kernel.org/show_bug.cgi?id=221984


I've provided the needed firmware blob and board-2.json patch there that 
can be applied with qca-swiss-army-knife and some helper scripts.

Hopefully that is everything that is needed.


E-mailing here to hopefully get the right eyes on this. ^^';


Thanks!

  - Autumn :D


