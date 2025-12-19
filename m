Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD407D711D6
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+/ZRMSQfz2Pe5W3+kCSEEPyZ++ydw0qjFUACnxc7Hc=; b=AsDyFDlIfGlVkuNEP/YUCNBgIf
	GQ9eucA9rY5txf7NLmEJl3J12hUz3WCQTxjZjdWubvj7vs6J3+rBE9zO3xTV2sxKpd5hj3bEmf1qo
	tZUWxBx/1DLy2B5jCOaZnt/tuB/2xdLXeDgQWJOTQ90qXY7UfPU+XGep0/ZzrD8Zrj3hPMFhh+lug
	gRJt+w4EzG39ir8WGyzFTqZ+dn82AhCmhuUzJ/Mu815p2XdoGtzlN1zOVcXrmVnz5EiIeVMLArqZd
	n0dHxsCN+m56bOKYG4Ws8mi7yNdVi2LRYlzPHXd+eBx9ZyhP1pYTiZI3XN0FexORUoUUlL6ynLkk/
	C8pSvTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVSW-00000009nGe-271k;
	Fri, 19 Dec 2025 08:03:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVSU-00000009nFS-0tiL
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 08:03:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso870356f8f.2
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 00:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766131408; x=1766736208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+/ZRMSQfz2Pe5W3+kCSEEPyZ++ydw0qjFUACnxc7Hc=;
        b=u0S2u2eV9DZLa+7kSds+4kq3Ygj/ZL1W0I4qVyicOuZVX0P7df3Y5vOUkuKUQ26LGQ
         CMbP98sesTS/RPAlwh1IDSu1h2wvWXNyfNNrRdoPU+TvCVzw7kqnNAdstlnSyPdhME4E
         idAhpnojZ/CZENKgW8moeZKnfu+lepEXynUsfh96yFttjNHWpkMCXxsD4w20p9O/XysL
         QlwSpfxm6wQGlrW9kbrUCcM0TGRORs7wZkvdvxdA7tDX7FpOKSBzt1bYUDAW3uQVyTdo
         TpweoIySfyKWMM3+3fjRk30vaCja2UpuiWGi0QyhJxOcdqpPB0BgbYXabSUvH4nxRNwP
         ++4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131408; x=1766736208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+/ZRMSQfz2Pe5W3+kCSEEPyZ++ydw0qjFUACnxc7Hc=;
        b=mwAGWCgO1Ixd+Ks+Ots+0CxQmSMu9LYna+CqIaujrydRJxkCMRe+qOpuqFKv7PRamP
         9IRT5MiXjAQt/+ER1yMyszBMPXNSfTi1xkC7wb/8xaN+D5g1+f0YZ8HImejgb0fCnnwc
         F+gouXdueZqIlCQBshKrdajF3xn/m8n8U/2A8dfR6+Dk69/8vyU9j2OvNRZkZP2nbAZB
         JnESax5zh/8LS5A85nJWMcQ8gcIrdvw4qB04m8jrXgCAvI5+9wT+umwhZxEZqzv4IQqT
         URKXBvlafxWS+V0xtM3/4WGg+zMfV9ZASuV1gCuRC/MwKZ6x+C3emIKidQ3yOwVNaN/4
         WUDg==
X-Forwarded-Encrypted: i=1; AJvYcCWpAdSWrMd1eRPvQADDOJDIelI714o0QVXuBzRJwRLEAnlIfNAb5Q+91L4xdpfgBzeHZE7iOF4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywze4eQjHbWYhwhgeO3kYxTY4m4YTJ/eBgCXpCNzzVu8b+vOtuA
	3ffv6gd2WKSgUYF/PvPfak3avSXOh0RumzQ1GJ8vUGhCKuEiRywILL70IYAX7ZlYeaA=
X-Gm-Gg: AY/fxX7Q2dcKnVdOCt0nGZi4oWxVXFXGOSPxOlPkFlYDdh4aoRs/ntcjfEh/o8tMCRH
	ACp7JbpAolDqYsOSQVYao1QoCMauRKSmqWQw1g6Uz1jPueCXMS2KizEdw+NbgbJwkF6WuRifT53
	NOBtpRFOR99UJEbUCjjDfLdJCEp0kSXMYvbMBZVWS2pV1/hRzmhyGPfqV+Ui8ihc5We/fnDln0/
	edU5UHD3jvhPhNd1sO8J/G527shKweMAmKRj/mbUffRjSaT7aGTvw4RTZ6oEZ/6dpOfBWIp+W14
	3jrxFVGHEAwqOOm/gZDLQgqXrYYy8xLFRPFIClYRAo+2S0uy1BNhPQHkAo9t8xXYKAM8oFcKOAF
	V+SVJahSKGfOrKLb08NCOJgf8O9v4e09gaY4e32H/oZ7Ya8MI7MikUjDkzhmiBiqVpEo8UirYWD
	CxMfn8MRrjiKVtdtvE
X-Google-Smtp-Source: AGHT+IF2eEWgioDzK9v88hc7zvDgUmt9tMsxScJV1o/NErRD5qEO8zTzXYks9Hy32CtcRV+DzuDAtw==
X-Received: by 2002:a05:6000:2303:b0:431:342:ad42 with SMTP id ffacd0b85a97d-4324e50d6d7mr2001778f8f.44.1766131407550;
        Fri, 19 Dec 2025 00:03:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm3644036f8f.1.2025.12.19.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:03:27 -0800 (PST)
Date: Fri, 19 Dec 2025 11:03:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUUGzCA-M-D3VFj9@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
 <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
 <aUT8KrV36wF8ITIK@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUT8KrV36wF8ITIK@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_000330_275559_FA566361 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, Dec 19, 2025 at 10:18:02AM +0300, Dan Carpenter wrote:
> On Fri, Dec 19, 2025 at 10:54:03AM +0530, Vasanthakumar Thiagarajan wrote:
> > 
> > 
> > On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> > > Destroy the rhash_tbl before returning the error code.
> > > 
> > > Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > nit: The next branch in ath is actually ath-next.
> 
> I'm working with over 400 different branches, right?  I can't keep track
> of them all so I just put "next" if it's in linux-next and leave it
> blanke if it's in Linus's tree.  It's automated.

For automated QC, it's really easy to automate on the recieving side.
In some ways, since there is only one place which recieves code and
does QC and a hundred different people sending patches, then it makes
more sense to do it on the recieving side.

This rule started with Dave Miller.  He was handling a hundred patches
a day.  Everything in networking except for wireless.  Also Sparc and
ata.  This was before I invented the Fixes tag, so that wasn't an
option.  Greg and Andrew still handle that level of traffic but they
just use Fixes tags to automate their process.

regards,
dan carpenter


