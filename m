Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D5606A327
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FSkepQQ6;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uiftQzpq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=; b=FSkepQQ68jafrA
	GgKBTuDBolxevC9VKNEkLVeh7IQUvZZjsIymC9iVHKeZ7psxZ77CQvwExlts/MGzHf/Px0krz/7FI
	bcSq0twLzhTao5YE6DCISn99Ok58IiOqGMeYapU5p7hwo32TdVIMlyZaDCcYIQN4ePMv6yDKsVr+d
	+3mIcDWW+JDkyn82TGixIAGuoP5ZvUT3zbiiSwABn1sRuGviFpKWE5omXwnDf8ipPADV0tj0u8HRb
	FbclhMQiA6NYBXax1xMnYvYgAMRhPF2p+GhPgeVwYEwxtx6yj64T0pLdgeSvwKAc08+Hm3DO76io1
	JYe/F9AQzQglC4oM7ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHR1-0000000GW5v-3coT;
	Sat, 14 Nov 2026 17:21:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHQz-0000000GW5H-2A1V
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 17:21:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so2511731a12.0
        for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794676859; x=1795281659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=uiftQzpq3ay/OkPDJ5ik/VS03ZAXZnnV73iRbDKJsnr//25jthpl9O0vK08FkKPHHh
         LGqQlwZaXQ17vhfkdqQtolfQSsdgXRtDiPBTeQD7jvD5fB9zxcc3FG2PuDqkio334ooG
         4w/j/TmDyitGpZUOjGOHalW5viR+Io0HsHs04udDeS3NZe9M8o+QT8j2wd7O0oQiRbD0
         iFLqy5hBJ4wI8XQxCg6DGgudvQI7koD7rEGjsefmYbf79tiFDJKn3MVlJHk5zC0Mwgxs
         qwLC6twD6HaA+LpPdqmoE4IoOVrJOzbg1q1geeaxTDbL8ZQITZ4hNlobEoWyMqdp5XZP
         1VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676859; x=1795281659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=Zcs85DsRHgbj4+NhJTVQK8bMXSjV21vPgZ5XyGGkSximvcqVQ9pCGzQgVk+A4lYT2w
         JTJQbfRhD726kT/PQEg2tPNILHeKoOrBJMUW2PNxN43nBDLKh3YRQxqOexgW7nkHa7U9
         fbTBKX5lSz68Bkrf5LK0s2ioy7MBz31B+to1Oldai/HV9GT/MOA87TVTZGzlk2smD2xP
         cq2o5TO9xy3z9Y2sVQoFigOyWpV66MQa6ENqXE6U/Y4YDsJy2CKSMqeqNwXINzqAK5s8
         vvMmGXfcRdWCG1xxIyBTZC682eegu7rwCO+lyAim/Lc7IiskCjaODHYQrqCE5QxTOr7i
         t1yA==
X-Forwarded-Encrypted: i=1; AL+hErFqLsIXToU1NgJRQcJvutkUYpXtB6u3bhnLRuXQqyIEYgqrnVjZDitsefwqu4zxwD73YGwz6fQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8iCl9XjhT6ZoKoFfLwyeNmj7ihn/iWsae0PoC5S0RYhWn0/mbG
	Z8y8gaH4DqUUmI9mZ/Z5AMugz/mNgiMcGkRD1/TV0/yhXSjBLZ7sRJb2M3MWNqImrA==
X-Gm-Gg: AYBFou2wo3WggJd+rE8IxNVp34sr16AHmjMkdp5Q0+OTV62yHLA5rueFUx3qx5malhr
	CoupQhDkv3db7bmnIikQlnwgykvs4q21it/LTKYZuXY5ykr9xM4rR8cf51YyMh65xfN6WmaHdZg
	S2AzEbcExeBPml+8jIm2yBj/GzG9O4D99fXfWWAO6XXJjRihGeI3MRy9VofMHJdDxx7ZEHul4kr
	+e33+H94bxMU+ervU7ff08X3RnomoypaHAYvKYKoo6qfIm7MFPvtT8YNCVrUjr9qsv1HdAinl76
	LbgEZm02L5u3caEJwURDGZajSc8l4C79URe3y7SU4rutHIJ8N5iNLfv8hrrrGiAPZx1ci1XOHBq
	ceD5XjWdFKgo+yCMhduqlzI7IxHXipq5eTG4GDKCb2LrrTkD1yNBlhLP+KiPKI4jkuGs4P/zNz8
	8Pku5/WKkYlDT6PXB+W96Pibj+FAeSIIOtE4AUabayQbuhmH19tM983ThvwLh/Q+eIACa1Np3N0
	NNSB67pPz72V5YCdjo6LR3iNvOmEIOu05LbANwiIiKiZpSrudzjTdmIhWpjdKE3iW9jv6zXvrxw
	XqZ5b9cVcMY0dFCDp0YrXOo8nkmKkFXvPh9z5KsMCFG4dp/Wuj3FHuPVOEPee5CWycLO+0rL0Ee
	PA2knnaIYMuZ7L2nziv79v+c7QqmIRdfrKEjBMiyfK9Yj/6iEPhYgh/vrHU6aCseOrBaqZ8rmxo
	tL8fkMh2nq6EYAPRt7mJaxsPGkxFcZ2One1HgdBo4jsK/FLDT1tOtWSvzJbs1Hq+Qz+4jcTZ0WS
	jx2bReoYqbv6ygQdh6pP3B0cr6QUEBd8YzaYSdE8NilifjIys8qnoB6/RhF9JRvArpOsBjXq4zJ
	tmY8
X-Received: by 2002:a05:6402:320a:b0:6b5:6546:f7f2 with SMTP id 4fb4d7f45d1cf-6b7c0d144demr4458124a12.37.1794676859188;
        Sat, 14 Nov 2026 09:20:59 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1a08sm2462848a12.5.2026.11.14.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:20:58 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	manikanta.pubbisetty@oss.qualcomm.com,
	kvalo@kernel.org,
	sriram.ramachandran@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Sat, 14 Nov 2026 18:20:56 +0100
Message-ID: <20261114172056.678298-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
References: <20261111080620.244164-1-julius@bairaktaris.de> <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_092101_570766_28D03A24 
X-CRM114-Status: UNSURE (   8.65  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 10:40:50 -0800, Jeff Johnson wrote:
> Is this a theoretical change or are you able to have firmware pass too short
> frames to the host?

Not shown on hardware yet. The overflow is in the host code and a
harness that runs the driver's MIC path under ASan hits it, but whether
the firmware hands such a fragment pair to the host is the open part.

I'll measure it on an IPQ8074 with ath11k. That needs a USB adapter
that can inject raw TKIP fragments, which I'm buying now. I'll reply
with the capture and dmesg either way; if the firmware drops the frame
before the host sees it, I'll withdraw the series.

Julius

