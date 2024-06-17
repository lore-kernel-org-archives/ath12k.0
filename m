Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036EAC27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz9ieMeryMQdJI810p5i5mSjqDk+I0PsHwTCr2HzwGU=; b=mz03yGWYNcKagpK26edZ7O8p3h
	/1JK9u3evgUheoKiYG4rIzjK611OyIntfQ/e4HMFhX09hUt4x2cfxTkWK1+vrKGw3cVh16+aEmhCh
	4s1sANftZ5K8zEGfMNjOLO72Gsr8DAMlfv4i4BcTU8IMVvDiFZV/1w803Vz8zqES7UN9ZEGz8PNK1
	Se5v7r15LQVTxK4bfGYh9shPzRUPOCtIhHstEuz2xJdRuEXHs6QtehgGCB3DuCOWsqS2vEohWE+d+
	afpTr6fikCsUz5NiJTkn9J1VgsY2L8GZGKo9vjXg2uGC8ST23oCnk28dOWdNt5JXpvs5Ux+O6LQLC
	F7dUwU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9qF-0000000AK6n-1e1a
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 10:44:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9q8-0000000AK3s-35JE
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 10:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 187CECE0AD9;
	Mon, 17 Jun 2024 10:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A47C2BD10;
	Mon, 17 Jun 2024 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718621033;
	bh=rCJPCXIu8LZY5v9GcPLg0APTKd8DO7Lztus0sEHhEFE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tjfXdF8yeQXG7NHwMyvRhY64QiV4Jpi+EKf5H6RnIid2pfXuHgz4FexxL6kJzc6bM
	 21Rr3WATrrZ6pjTPTs2sHov/GbD7Ixh9ajNTQXVaZar4Hrh2oGP9n1o7IfY1XdDCKg
	 /zM0VxjwsPkkNIOLxjeGi4U9z1ohT4el28U2+1eHAKM6vB1aY+QbACCrjNM6eQsEIh
	 Ng3Q7G3qsUYX99+7kKEA4hDVmtP7H2ZbUY86Klz578yjGkhkFoTJSWswBkf77Ym8O/
	 jJ9vXc8j7vjICWOLp9yTf54rYjtLYkom6eCjlLVSVPFcUzh6GOj/HmBE0IqUfUuAmw
	 MWqXfnAuYvY/A==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Aditya
 Kumar Singh <quic_adisi@quicinc.com>,  Zachary Smith
 <dr.z.smith@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix legacy peer association due to
 missing HT or 6 GHz capabilities
References: <20240612225336.2303119-1-quic_pradeepc@quicinc.com>
	<760d99d1-c709-43b5-9d15-c2a0fef98b66@quicinc.com>
	<a7921a28-6f36-40b4-9d56-284b2c2684a6@quicinc.com>
	<199dbb00-424c-4827-ae9a-0e657918fc06@quicinc.com>
Date: Mon, 17 Jun 2024 13:43:50 +0300
In-Reply-To: <199dbb00-424c-4827-ae9a-0e657918fc06@quicinc.com> (Jeff
	Johnson's message of "Thu, 13 Jun 2024 15:15:52 -0700")
Message-ID: <87y173n921.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034357_076562_F3FBDB5B 
X-CRM114-Status: GOOD (  11.56  )
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

> On 6/13/2024 11:59 AM, Pradeep Kumar Chitrapu wrote:
>
>> 
>> 
>> On 6/13/2024 8:42 AM, Jeff Johnson wrote:
>>> On 6/12/2024 3:53 PM, Pradeep Kumar Chitrapu wrote:
>>>> Currently SMPS configuration failed when the Information
>>>> Elements (IEs) did not contain HT or 6 GHz capabilities. This
>>>> caused legacy peer association to fail as legacy peers do not
>>>> have HT or 6 GHz capabilities. Fix this by not returning an
>>>> error when SMPS configuration fails due to the absence of HT
>>>> or 6 GHz capabilities.
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Fixes: f0e61dc7ecf9 ("wifi: ath12k: refactor SMPS configuration")
>>>> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>>>
>>> Per checkpatch:
>>> WARNING: Reported-by: should be immediately followed by Closes:
>>> with a URL to the report
>>> #17:
>>> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>>>
>>> Is there a separate public bug report from Aditya?
>> Hi Jeff,
>> No, this was internal report and does not have weblink associated with 
>> it. Also, do not want to ignore reportee.
>
> I'm unsure what do do here since there is a requirement that an acknowledged
> reporter have a public link to the bug report.

I think it's ok to ignore this checkpatch warning. Reported-by without a
closes tag should be fine.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

