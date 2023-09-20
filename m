Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2C1CE79D0
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2NPUksHDo6ol/QWA/X1K5KN2oLZlvSruIhOkS0CoAM=; b=mjg7VnzHDarUU9
	9xdHfO+4yFSttPdQMpdlCdMSnyASaNsmy5DWJZxl/aNF9gSivnChedKdhVJ30FoMPRaQbip//GH/e
	N3rYG53V49bPyIb3wnEqsqofwe8DxscpnKOiNM9s2KBQqSEUjWVgC1ARaoRqxtUUmMVop+5I1GePQ
	SpKNHyzZejtvvmMIqce7jCUrcZPaiB70eYjm3MUqIHzpp+O5wa10SXWxB8d92zOI8zwh5qc/FKhpB
	ctryLCK9faP3Lji58C1gaWoNpfOcPCMz9STzEvgTigGLGMGPrWzUPhQHCqHgQK2608ulcTMg+Aj8O
	pmsXRjuxrSi5ZOS08A6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixLf-003C4H-17
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:34:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixLb-003C3M-2b
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D9A261C35;
	Wed, 20 Sep 2023 13:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58765C433C8;
	Wed, 20 Sep 2023 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216870;
	bh=kVDWaUupyJsjXdNWOC1wPRQydQz5BbV+lMqJ1V1rEZU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HoR6aqQAwX1Q4jXYdNNxxipldr68seu5mLVSfeh5gn0d3MrRhyZDev66iBd8j1LDX
	 VoQqYbN/kMxcCMg/CiKuFY9FxE4118RUyQ0lj48MU04AwcCdmi/+6Q9i+xSWt7U8fP
	 KKmldqFdeRy3QHHe4KFk1RvNrYeztVudE2qfeRmLI3PP3OTDr4CldnsLGBmvQN9xYR
	 SDlpfNp9HsnE5GFqSS8eEx6rqG5fohRXm39xTPVEDLh/2Jd5Svby+JGfy6fteFKsGy
	 r14v25PzhxoOo08dQwrcHLbMfXVnIn6QbCQ7oXdZLcmFAiuwws+Chvx9mvIFcLqSoA
	 aQL3tTCaEtZew==
From: Kalle Valo <kvalo@kernel.org>
To: "Aishwarya R (QUIC)" <quic_aisr@quicinc.com>
Cc: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
  "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
  "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "Wen
 Gong (QUIC)" <quic_wgong@quicinc.com>
Subject: Re: [PATCH 1/7] wifi: ath12k: add support to select 6 GHz
 Regulatory type
References: <20230919071724.15505-1-quic_aisr@quicinc.com>
	<20230919071724.15505-2-quic_aisr@quicinc.com>
	<4282f92a-3543-4863-bc00-478ae03759e0@quicinc.com>
	<0a83690159fa452b9e7c0ebb3f751b55@quicinc.com>
Date: Wed, 20 Sep 2023 16:34:27 +0300
In-Reply-To: <0a83690159fa452b9e7c0ebb3f751b55@quicinc.com> (Aishwarya R.'s
	message of "Wed, 20 Sep 2023 05:48:27 +0000")
Message-ID: <87zg1h9dek.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063431_886803_049D9E7E 
X-CRM114-Status: UNSURE (   5.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

"Aishwarya R (QUIC)" <quic_aisr@quicinc.com> writes:

[deleting ~500 lines of unnecessary quotes]

> Thanks for your review. I will address all your comments in next revision.

Please edit your quotes and only include the necessary information in
your reply. These kind of huge mails make use of patchwork very
difficult:

https://patchwork.kernel.org/project/linux-wireless/patch/20230919071724.15505-2-quic_aisr@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
