Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D2DC19776
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUy9M5HV9p9S6goYWBEtQkOjb1wmn3X9SwMBmIALgzs=; b=pV6wzUWviTBJQVb1ezpjfCoeaO
	4/MdM7xTqv1CZ/d+3C/xVa01r3tjZ2kROJtbvrTv2bmkJ5U6MYGJjH/0pwB4VzAriQm4EqFnhQraT
	nCucYkrAdixVPBLCPILL5Al4alczb7ivHqnYRabQqkg/nw0prA9PSGmzrOEK4ferb6y0zndJb9xCz
	/LbtOawjOsa8Tn+8DNp95l9says86XzFn3jRFvhLRR/RoKpCe/+B01kx1q7gl6zWc64Rz+NjMT97X
	Q21vq9Rc5LXJzquvBk5hSnPV3IYTcQTV1IT1sJwoXsCCDS/E5rpidRAsQpe5FOtbBH0E3QLtPFuz0
	Y6gUw4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzXx-0000000AvNy-1fOf
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 12:32:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzXu-0000000AvNQ-2x3T
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 12:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=oUy9M5HV9p9S6goYWBEtQkOjb1wmn3X9SwMBmIALgzs=;
	t=1740745968; x=1741955568; b=Th661tN32gUMysmn208a5aOjNH/V8b/BBu5qYh4dPjP15YB
	TgJEQl+8lZq2aChsBcMZT06e100qvbH1SG8zyNZmXWGW0dH4KSg94i2Z5RcCV26V5UjWebx4ElTSO
	PQNstoflLEeimBwCCja4EdGTz1AW2csIjkMFyazQgFwBu8tZJ+/Tx2k6ZBkMYYZf+rHFKt7r95BxI
	YirKjcD+hEV95IfnMMThLW2BT+xZ5kpHrgaQ6+E3qXpE8tDS/SNM4pn8AMWXT5uLxvEgH5VkaBpBm
	t3GCgPx25bjXzCR4yL1IkcHuH+OExNOXnP1N17Rzk3a75ZsncUCu18inQVVA11TA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnzXp-0000000Dj2c-2rQD;
	Fri, 28 Feb 2025 13:32:45 +0100
Message-ID: <66e4ec1984c816bd8e0a95a8bced753d780e30fe.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: cfg80211: Add support to get EMLSR
 capabilities of non-AP MLD
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, Ramasamy
 Kaliappan <quic_rkaliapp@quicinc.com>
Date: Fri, 28 Feb 2025 13:32:44 +0100
In-Reply-To: <20250117170416.2907530-2-quic_ramess@quicinc.com>
References: <20250117170416.2907530-1-quic_ramess@quicinc.com>
	 <20250117170416.2907530-2-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043250_750612_CEE2FFF4 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, 2025-01-17 at 22:34 +0530, Rameshkumar Sundaram wrote:
>=20
>  include/net/cfg80211.h |  5 +++++
>  net/wireless/nl80211.c | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 363d7dd2255a..7a80dbf37881 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -1756,6 +1756,9 @@ struct cfg80211_ttlm_params {
>   * @supported_oper_classes_len: number of supported operating classes
>   * @support_p2p_ps: information if station supports P2P PS mechanism
>   * @airtime_weight: airtime scheduler weight for this station
> + * @eml_cap_present: Specifies if EML capabilities field (@eml_cap) is
> + *	present/updated
> + * @eml_cap: EML capabilities of this station
>   * @link_sta_params: link related params.
>   */
>  struct station_parameters {
> @@ -1780,6 +1783,8 @@ struct station_parameters {
>  	u8 supported_oper_classes_len;
>  	int support_p2p_ps;
>  	u16 airtime_weight;
> +	bool eml_cap_present;
> +	u16 eml_cap;
>  	struct link_station_parameters link_sta_params;
>  };

OK, I get that this is the minimal change that actually makes this work,
but it seems a bit lazy to me. Allow me to explain: You don't actually
_want_ - nor even implement in patch 3 - this changing at any point in
runtime. OTOH, you _do_ need it to change after the station is
allocated, because in auth frame exchange you don't have the information
yet, and that's when the MLD is added.

So I really think this ought to be accompanied with a change to
cfg80211_check_station_change() that disallows changing this while the
station is already associated?

johannes

