Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F00C47077
	for <ath12k@archiver.kernel.org>; Sun, 14 Jan 2024 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tAqmWO+9ZTznLFOpIl1KeZde35dWnY+hXs1P0a7oB0=; b=BhYCcMeQoT2p64vK8ixq59C/N7
	Q3ZcAms/LN/guhBfXl7p51DY1xU4PZdEdPqRlHTyXdlcff0a7V+lkeaDujMcdLVQfv6ufADv9S/GJ
	RIsm9wEC18w/W5VBMMwRvWkbrrjRDPDYe57Tp/7qkpO99+VX5/Z+Dc6zR6P9lHfNh7fyyOSqHq5q7
	mrmI89XXzum5gkpehJjNIurGipPaCJjYHTtYghJdby3W0NeRr6usGeYWXC3lIhlVCrae0pG584onN
	70Tvs6SncF4j9g/FZUcP29SB7BBzmXSRYhhfvQlzKDagf22sZ+YprpA3h4WtivHxiz6KW6HCUwI80
	ex6Vj9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP1z1-006ra4-0a
	for ath12k@archiver.kernel.org;
	Sun, 14 Jan 2024 15:01:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP1yy-006rZd-2G
	for ath12k@lists.infradead.org;
	Sun, 14 Jan 2024 15:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4AA5BB80A6C;
	Sun, 14 Jan 2024 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A519C433C7;
	Sun, 14 Jan 2024 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705244462;
	bh=aRieRp79l/B2y5vjKinEX+iYJeaHanzDnbFW5Ls4f7c=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Xe4D1PxZsT3269QVH2gTyELMT7aGAoEsaGU8YG8fdfFBHVPNNrrblvLV2MoCokdqg
	 D1XUnCNMRzsvgdXhvczZx/35lGmUOQbtCs5U2zb5aZv2rtpQbmphTUJSCz/KbjQNNx
	 5+ZwukFf9axgEUtA7mZGYogLkaZivYrVUAn8xXRQ0ZGLRipyvAcZIAt/DPeGYaieiS
	 xQQeiLfA0iTewi5iApesC35R+hUr0rQ8z6INWobFL8LtOR09iA0vZkUqIcozYVohLY
	 fihuo/wsCduIvBOj8oULK6w18TCjfyQVU6BIevIBXgZyL5KZHqrdNJnQTifROaLFIC
	 y632ne2aIyD7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Remove unnecessary struct qmi_txn
 initializers
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240111-qmi-cleanup-v2-1-53343af953d5@quicinc.com>
References: <20240111-qmi-cleanup-v2-1-53343af953d5@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170524445957.1421352.9255954399937351219.kvalo@kernel.org>
Date: Sun, 14 Jan 2024 15:01:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_070104_894617_E8DFC0DE 
X-CRM114-Status: UNSURE (   6.39  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently most of the ath12k QMI messaging functions define their
> struct qmi_txn variables with a {} initializer. However, all of these
> functions subsequently call qmi_txn_init(), and the very first thing
> that function does is zero the struct. Hence, the initializers are
> unnecessary. Since these consume code space and cpu cycles, remove
> them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

59cf57ab3dee wifi: ath12k: Remove unnecessary struct qmi_txn initializers
2e82b5f09a97 wifi: ath12k: Add missing qmi_txn_cancel() calls
6d2b0a066941 wifi: ath12k: Use initializers for QMI message buffers

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240111-qmi-cleanup-v2-1-53343af953d5@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


