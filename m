Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D53606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SBNSGZTo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=froggi.es header.i=@froggi.es header.a=rsa-sha256 header.s=mail header.b=BUNsYIF8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eAg82Xtp0EgNaTRDyfIctyVIuMiG2lzs2vN6YDrsZ/U=; b=SBNSGZToXWqNLH
	N2Vn2kY5iyMGDGusS/TJJGd+hEH7b/H60z5YTkqCT+qbJAaJMaj6khU8y5M/zm3wS5yjjGFWZKM7b
	3vQqq5jd4zi0Z2kPX4Z4jD5YkE0oyyDCyeT7RQPuWwWSZHHp3zNwN6okwNRufRy3XK9bYLR3787eS
	NVg0AF+Wkd2rB7d+6e13coIjIU1488W0KIFa6ePot86hV4qvpbw4IPjDE6yTlPHGGV/JS/FMnRyoR
	tf6GsLwGy9XREm4Ww3c8QH5weJoIg1RWdqSDVSTZCb2amCP7z3Kmwu8mGTiL3fC3ztcdnezweaIlo
	5AVB+Px0oTX1UdXX1fwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoGn-00000007gID-1BTt;
	Thu, 05 Nov 2026 03:36:09 +0000
Received: from sender6-op-o10.zoho.com ([165.173.180.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoGk-00000007gHu-1X1j
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 03:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793849752; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WejTGQSuP9uB7qpRf92C+/e6Y2BnmpG42/9FSeCjMoIWDTPoN+2p+j9OS0wlx+yBuvUCRqSifJafG99YppxExQn3rhJudr+A90IsyLhQb579+lbXGqlN012/jjCnSfopgPwUEluoI8TYLGR8ebd8yUVsUIF4Y0ta4AF+K6dhE2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793849752; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eAg82Xtp0EgNaTRDyfIctyVIuMiG2lzs2vN6YDrsZ/U=; 
	b=fDRpW92SGNDINLbdUV8G5KF3ICJcjQuMPRYysGUuRrcyRIHUZr4D7DRlsU/jWm2l4hK2OG1s+B2UH4V4dVviRnDNTO39FTTXQNIWRT2TKX9Y8yZ8H5RH1SMH85pHwNav0AF34Dq4luAYwf0phlRF1iXSSJ5ZI2VgA3pZ6Ezz2uk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=froggi.es;
	spf=pass  smtp.mailfrom=misyl@froggi.es;
	dmarc=pass header.from=<misyl@froggi.es>
DKIM-Signature: a=rsa-sha256; b=BUNsYIF82qNFdmdmytjE61+6hiny/YK/v3dHyqwn0UntlTzElBAREDRho3F9J7WHJ1+24CZWSgNdFbPtxT2Odz+O8LwrCGyEvqjUSdSdLczMYHsFmfSyevVyqouCJfEqI+DRRMKU1i9exwyEgPirhdJlavr5z7747szL4pSDpD0=; c=relaxed/relaxed; s=mail; d=froggi.es; v=1; bh=eAg82Xtp0EgNaTRDyfIctyVIuMiG2lzs2vN6YDrsZ/U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793849750277579.2861917869354;
	Wed, 4 Nov 2026 19:35:50 -0800 (PST)
Message-ID: <109e5923-92d3-4686-a4bc-5ad42c3a44ac@froggi.es>
Date: Thu, 5 Nov 2026 03:35:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Birk Skyum <birk.skyum@pm.me>, ath12k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>
References: <179381165259.84724.9229191626653570162@pm.me>
 <35fbfa41-a636-44fc-b996-9295e265d515@oss.qualcomm.com>
Content-Language: en-US
From: Autumn Ashton <misyl@froggi.es>
In-Reply-To: <35fbfa41-a636-44fc-b996-9295e265d515@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_193606_464356_0E5631EB 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's a Bugzilla entry for the Asus Zenbook A16 here with the required 
firmware files, logs, and board-2 modifications.

https://bugzilla.kernel.org/show_bug.cgi?id=221984

https://github.com/misyltoad/asus-zenbook-a16-wifi-firmware-patch

- Autumn

On 05/11/2026 03:22, Baochen Qiang wrote:
>
> On 11/5/2026 1:00 AM, Birk Skyum wrote:
>> Hi Jeff,
>>
>> The ASUS Zenbook A16 (Snapdragon X2) comes up without Wi-Fi because its
>> QCC2072 card, 105b:e14f, has no board-2.bin entry. Qualcomm's Windows
>> drivers list eleven more QCC2072 and WCN7850 cards that linux-firmware
>> has no entry for. For each of them, the driver's INF sets the same
>> BDFileName as for cards linux-firmware already lists, and those cards
>> share one record in board-2.bin. Could these cards get entries
>> pointing at those records?
>>
> thank you for reporting this. can you please share the dmesg logs ? we need the driver
> logs to identify which exact card you are using.

