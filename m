Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE4C77B7F
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZz0bJP7qfgshQFq6ottKlcCPqZeoRwUQLdXEdnTbk0=; b=1iV4vLYizKQfUReRbnJMdllfJV
	DoT/i7q2EHwSOvaW5H241MQJyfawVtGtb+kIQUji3O0R9vBQFv0BMJ6YPrZllgZN15w6uoDxQniw+
	qrRuXDBHvl/6RbKzer5hJfKowbl43CYgJpOQ5NWOxqM9D7ZImeRgQqIUV7C4RMeIUNwyvFSUeaC4Q
	CP8W3ljrGI6I51Js3JemXNR5zuNiWFK3lw33PGlFnySWGWHitIy25/+0Nh2qP4dSeLQTsi8X3D343
	qOqs95Q7exBUN2Wr98jWtsvQ+W7H87KmVQVYOXJmDsvVC/Q46NlB78NNGJLB/fF502spGcC5DZUQy
	qp+fl7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9k1-00000006gkd-0Un6;
	Tue, 24 Jun 2025 19:55:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7UU-00000006O9M-2C6c
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 17:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=aZz0bJP7qfgshQFq6ottKlcCPqZeoRwUQLdXEdnTbk0=;
	t=1750786285; x=1751995885; b=fG2tQivTT7SKYySbgBY10IYspLZ8RkZL+8ZD8nEE7m8sXQV
	NPJVdnlZB1CjRWxoRa2NT0rBI4cm5cTuNT0wtOgFQ9hsTeXM9Up4yGetOSDOs3NUW7tG2GEMde9nn
	Q8O4fTjzswaIAHm6TVOzYoz02bJ9EQOC1sbS3ARCvCzhieYyBZf8qA7ce/Yn1gjRJ69dgC7ybNbMF
	NpLlU44iD2ylI9i0SNVlNHsYNbIp4bIg13XpxokktZQx34f8iiF42J/myYrrUfgq7tGlt05XbP8RA
	tlRb/+dm3yfjospLI6NYIlR1zcLIPDZJue8YXiXzDX3lbV1T6qHSwy988MswYvaw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uU7UR-000000090c0-0ny5;
	Tue, 24 Jun 2025 19:31:23 +0200
Message-ID: <0b29ee81d16f7c75a2cb7b5e48d30f945e36b7ce.camel@sipsolutions.net>
Subject: Re: [PATCH] ath12k: add module param to control MSI mode and
 address width
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Govind Singh
	 <govind.sk85@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 24 Jun 2025 19:31:22 +0200
In-Reply-To: <58fa9f69-2525-4c6a-acc8-571b20a4646f@oss.qualcomm.com>
References: <20250624165031.58616-1-govind.sk85@gmail.com>
	 <58fa9f69-2525-4c6a-acc8-571b20a4646f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_103126_557761_70170478 
X-CRM114-Status: GOOD (  13.70  )
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

On Tue, 2025-06-24 at 10:26 -0700, Jeff Johnson wrote:
> On 6/24/2025 9:50 AM, Govind Singh wrote:
> > This patch adds two module parameters to the ath12k PCI driver.
>=20
> Please use imperative voice.
> And it is preferential to first describe the problem, and then describe t=
he
> proposed solution.
>=20
> >=20
> >  - ath12k_msi_mode: Allows selecting the MSI allocation mode.
> >    * 0 =3D multi-vector MSI (default)
> >    * 1 =3D single-vector MSI
> >=20
> >  - ath12k_32bit_msi: Forces the use of 32-bit MSI addressing
> >    by setting pdev->no_64bit_msi =3D 1 before IRQ vector allocation.
> >=20
> > These options are useful for working around hardware or platform
> > limitations(ex:  i.MX 8M Plus) where 64-bit MSI or multi-vector MSI
> > allocations fails or cause stability issues.
>=20
> So there is no way to detect this?

For the record, Jakub has very much been pushing back against new module
parameters, so I don't think we should take this.

johannes

