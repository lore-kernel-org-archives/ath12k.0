Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D39C98332
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzMeIs9tBh62lQd6dZPpENkTHWEmBkK/bt48HVj5kkc=; b=gw2vfQlynJrwAWvfRq3etFGrgA
	1J5P5DS26fYX297qyE1wNIzGv600THsOC01ZG43CvHmh/Zapf8xVNbuO0L6g6QE55J2lOeX3VxO/A
	/fKULjdrv8kIWUtHXXbZs8C72HMzil5Hb1E2BoTZ3u9KjjkUOOk5GGwhHwefnYhR+dwxwCJqnyT5f
	hgc5BoHmPpzxxg23bR45Oyzt/QIGyYWuKG3iENervVvf/iCPn7+lmKZZclfZ8DfvSF2m+svBPeIW/
	JxzpuMNSKWLWAkIpE4YHcpOE9GrECtzNsqjdK48Fjd7q65TKBlJZ5HLPTqJkEahnoVsIL7NLnu4Uu
	Nt6XX63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARbL-0000000FO4U-2JVg;
	Sat, 26 Sep 2026 12:33:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARbJ-0000000FO3N-37Xw
	for ath12k@lists.infradead.org;
	Sat, 26 Sep 2026 12:33:58 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so2913085e9.0
        for <ath12k@lists.infradead.org>; Sat, 26 Sep 2026 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426035; x=1791030835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RzMeIs9tBh62lQd6dZPpENkTHWEmBkK/bt48HVj5kkc=;
        b=G1ZzFdqH4MswlqaCioX+12QG5g5wR4qgO1zFh4tMn+D+Om9aWLouX269Nj/oxg3EkC
         2pTJxHfx9SEAl2G7VhFpRAFSuD7XB+ISzHlCYd+FcFrr2eZV9k7qyiQlClKfPzAzyGrv
         IZmf2IE0eNI4GH9frIBL8yXmAYRksraMiTnijbw7q0Lsc+WQXpqaby/RuucGZfvUwONT
         WWqEqvFvZ5yyE4Y3Tb/pvVpIz6sRRlJ3Al7ZNtFeJBR6Lx9oHa4IjvicEppk90gM9uK/
         9X24iSrSb8oo1JyjZs65bjB7gMy65nQLlZXF22E2ucIdTxhTIqZZgcKVIoYOp4TEUt1i
         eVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426035; x=1791030835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzMeIs9tBh62lQd6dZPpENkTHWEmBkK/bt48HVj5kkc=;
        b=Iu483ywpqB4G1Uad/KUZHarSX/pWfCnuSpaR5WOAzuXgs3B8pXzc8dv+N2XEJ3Yn2z
         PF+Eci3IzoM8qLLrtxCs1BQwyZt8HycRbHmi0OFd/MrrcMsM7N7m+zUETvDddtGoog9g
         vQ99+ECyz7jbm0XPFbwym4AIE06Oq2Itfu0lPe5G6JNv3ioelCKQu44jU7CUJrlMtwzG
         qMjSiEWfOFl47yW9n/tUh4tLuq/rIuQJyEM4RdbvwTOoBXWhYMo3KB1TNqTbQV4Aovqb
         IDhGAtf4SdR2swxxMxtt73C4f8M+TqWmKJonQsa6qLh0fPCMpdXjN0d3onfh5By17CoH
         BUPw==
X-Forwarded-Encrypted: i=1; AKwUvBxMmyng+3Y8niFf6JNk5xzqNnOgqddtlKmQNhVG5/Tivt0kwd7QtY7rTrRP7DenamGWduE4Ixw=@lists.infradead.org
X-Gm-Message-State: AFuF++maMX+HDYvKktKLLtJxgBGw5xFnlBbrGqJFCxMG46iURHQcubqU
	SDipiappGEHwVal2yomOFMZo9BZmyTNXPmgk6wPa2WIL2hLvdD+Om5nh
X-Gm-Gg: AYBFou13tmVeEPaPYkDqqITaqgfeWPCDWv9OxAzMrvuUvVRqQyJL6drPAwjCQH49Qe4
	pvqLL+LfRZGgrALw5Z3tAz2k+BjfKtPq3JeNr0dQ+7OR9Eh56vGzNX5xg5IfhObBWMlWlRJvp0f
	r8DonTnsHM/J0ZZCveO7TB2zQEsxHiNJPf6jQz6Xq4OiDj1aDTfGfFHmXsVN2aZIXm6Gq3oi/Xk
	tVevp8qFT36giPycfkWMgrLR2nAy9YrMwcqWRQTAQj46629i7D3vmAjUKHf42bR6xqZ0AKDSDEj
	ZRP5be2hbtSNHM+IPwtFwUPZchNoqVlcXvYFtsB4vAEqNMZopgKH6lsMDF+UJHz8uD2PUVZFKsK
	XqgAEoI5rfGFbUdsGAJ/9H2+DeTILKw+71sc74LnrFAke7Sff548pi0Qhx5ujM7ZJip9mXAzLtX
	E+bF8Be9efXxmdfkgFGEbGfZvUSqR0cpzeWlrm8PGcSwW5mbbqJs8cPLHDOLUw7rATddE=
X-Received: by 2002:a05:600c:c114:b0:49f:fe79:62f1 with SMTP id 5b1f17b1804b1-49ffe79648fmr12725635e9.27.1790426035118;
        Sat, 26 Sep 2026 05:33:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm264713115e9.9.2026.09.26.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:33:54 -0700 (PDT)
Date: Sat, 26 Sep 2026 15:33:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
Message-ID: <are7rrYpcnzocHNi@stanley.mountain>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_053357_791791_7D0A7BE6 
X-CRM114-Status: UNSURE (   7.71  )
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

On Sat, Sep 26, 2026 at 08:12:49PM +0800, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


