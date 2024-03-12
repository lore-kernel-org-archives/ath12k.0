Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBEEC54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihz++E9B6/8HRGfur9tdMnVj2qTl+gPGQxmLPwTE2Ko=; b=AZubqbHYqKykLM8lpIg6TmtVZk
	bjB6IM4kMJ6u/UMShyKeo9XjNADDjSsco27dQTu31yAYdtu3NWLBQ7G0f2ugp1QdeAskY3d+jcLBC
	lP8jsCZdQljS7aEH3yx2gQa3+KqbxVaJpfA38xkI+x3p2y6JSaa2ZrBu9YweVyDQbOifJf+Pa+T5h
	VP+7udi/sHTdEH4fjQjCNJHmIsp7Ad2Uj3fxboAfmlYlspdXTFt3zQ20iJb0kUGvhgdYGNmuIpstU
	+3EIPIhoF12erMa24UCTSTZIm53tSX/Q84vTBMyRNuUwy+lIWtFlg7J1skX+wAIVco61cDAgJZDI/
	kLL3B+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxJO-00000004qmC-0NxT
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 08:16:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxJL-00000004qlJ-0pwi
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 08:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ihz++E9B6/8HRGfur9tdMnVj2qTl+gPGQxmLPwTE2Ko=;
	t=1710231392; x=1711440992; b=aqXH+ruStOhoQRlkwQvLx/88jre6rdD9fByFsO8NkpfFesy
	5C+5eYKQAXahwb4JfTJY6usvr1Ksr5Y+UkrFyIWJjd6xA3+eIqeUpg7bYSUEYz8uVcwQ5JgT3O0Pk
	LTLK9Ep89ZkLdb2JxinB6mYB+dWws8Bpg7YXqsJW9uRfk6tK+M2uLMlIknAnNIkAyTS2MPVxPz9yr
	gQ4DMS27TyyZVTaDPaliKafJR0MAyE6jz7Ewrg8PGOmcwG532uMFR4M3W0rkHOiMslSxRqPDGYtld
	3PmP+QBnFsWqiePm/2CmMiRBo4yhv2FBp3OshLTaaAmKZILNWIVt2Cmyck0o9AJg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rjxJE-0000000DjWz-1qLP;
	Tue, 12 Mar 2024 09:16:28 +0100
Message-ID: <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing
 bitmap
From: Johannes Berg <johannes@sipsolutions.net>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 12 Mar 2024 09:16:27 +0100
In-Reply-To: <20240312045947.576231-2-quic_kangyang@quicinc.com>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
	 <20240312045947.576231-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_011635_556114_88ECD598 
X-CRM114-Status: UNSURE (   6.18  )
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

On Tue, 2024-03-12 at 12:59 +0800, Kang Yang wrote:
> Current mac80211 won't parsing puncturing bitmap when process EHT
> Operation element in 6 GHz band or Bandwidth Indication element. This
> leads to puncturing bitmap cannot be updated in related situations, such
> as connecting to an EHT AP in 6 GHz band.
>=20
> So supplement parsing of puncturing bitmap for these elements.

Hah, yes, I just noticed that too and fixed the second part yesterday,
and was still thinking about how I could test the first part :-)

johannes


