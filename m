Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA44C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRFzKeorvUcHoho4cSxfcl/mZe4pdd/PnXwNhCoPvmE=; b=NzLfPr1cc4NL3l
	b5InswgNyPyUVAdtbJQtSKWyd8Mz9t4ljc3tXc8DIbuEu/gN3CjMUEMYyRQxlZAbO23tBGBtQnJCe
	aW0Zs3nCtSATJa/vvW+zEWpfVfC+CXgOkchLzAH1o6/bp7vbbwRAzDzWz09rwDxxdxUQJbBt7UU8+
	i112xxSZqCHBZWw45rHu8fQdv5W4TpWHaNpBuitOHzX6X4YXNtzKoFuqvFjYFumlMZU0kWHXTb9Em
	KVio/lz049NR8xMB5WEdkAC6qr2W6CyeCPJP7jzT6JcGe3jKsChJ2k47Iy8ngwZHSPKNtLviD0WS9
	bRmVWMuGiRGrJZopFiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeou-00AU7g-EA
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:01:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoo-00AU4r-2b
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:01:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id d40so3108298eda.8
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBg54i8HFlf7YdL+eumxeHdSui5/WcRHRQBRp5OO488=;
        b=WGzvvkLiuG9OGl6u5yOt/wqe45C8J2rgxFPIWQDQiJt1UkMrGPwfAHmkILvrgKlKqq
         RZUWIpagi0GyxiDbW9PE+kMwfNmWmcv4wKMPSQcmGM3ALM79fps/v7fzGsbsUjyZoZsm
         Q3Lr0YKHZfqoenqo7f3eRK4QNHgLnPk68zCDmPZ1m8CN+0T2/4Zp2Ax7ImQvuf2y/CdW
         9q2HhTVEbIl6K90ACP+Vdr3e0tSmnYNnEtO56VRd9JRVytjcshT7mHqtmyhqyq7iFDN7
         T1ARLo2eIJnwmYlplfMfS3LoYLzZ8nFnrkI4nxKPXUBDFmHPLc5YWBUwNzrgx5pWCa5e
         +b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBg54i8HFlf7YdL+eumxeHdSui5/WcRHRQBRp5OO488=;
        b=crB11P2BrMFBrC8qtI7hJvEtJCVgBh/gM+vLi46YEDeZ2eqgld60mv0VFQl22x+ZQv
         7j6294WtG2e9b2NRxYvXYn1RqwcjeCyRkaPMnUrsCLlS2W03XpWpDv58uDWs9lE3GD57
         LzBIk3JOjW8hSCGT9Ak6wfH1YiTCfzKLjCd6+KMBBKJZJXqWitKlCiKffn4Zpyp9KV/S
         cGAf1XLOPz6D6h8YQmalV4Al5HLwJcfTPxLW3bPfZ4Wev4YUurvit8jTfTPzd6xgI3Yi
         2srSXRKCTQ2e9OFoIIIZ8zM6BTPf1sZQW4qQVgym0+CTtXmCgP18hSTf7hpC5/ilN5GQ
         QIpA==
X-Gm-Message-State: AO0yUKVjlhq1JWbKSr9IfGbZAhXZi7dMNDoWQOtNsjzwg7MFJ2akjecg
	mBgIhYsRbrM1/VqJZZXgASu0wOIbyNVARA==
X-Google-Smtp-Source: AK7set87R+XQh3lQUlkBCsYaEmBn49Kq5OAFaabruA3DinHwGJen6oyluJrJtb4B4+HVpHPSTUyUfg==
X-Received: by 2002:a17:906:3c04:b0:84d:47e3:fe49 with SMTP id h4-20020a1709063c0400b0084d47e3fe49mr6481969ejg.39.1676556059642;
        Thu, 16 Feb 2023 06:00:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id jt8-20020a170906dfc800b008b13ce1c460sm851845ejc.40.2023.02.16.06.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:59 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: unnecessary div_u64()
Message-ID: <Y+43F8dEinSr04hW@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060105_801861_D7A048BD 
X-CRM114-Status: UNSURE (   5.15  )
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

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

drivers/net/wireless/ath/ath12k/wmi.c:5857 ath12k_chan_info_event() warn: div_u64() expects 'ullong' got 'uint'
drivers/net/wireless/ath/ath12k/wmi.c:5858 ath12k_chan_info_event() warn: div_u64() expects 'ullong' got 'uint'

drivers/net/wireless/ath/ath12k/wmi.c
    5851         if (ch_info_ev.cmd_flags == WMI_CHAN_INFO_START_RESP) {
    5852                 survey = &ar->survey[idx];
    5853                 memset(survey, 0, sizeof(*survey));
    5854                 survey->noise = le32_to_cpu(ch_info_ev.noise_floor);
    5855                 survey->filled = SURVEY_INFO_NOISE_DBM | SURVEY_INFO_TIME |
    5856                                  SURVEY_INFO_TIME_BUSY;
--> 5857                 survey->time = div_u64(le32_to_cpu(ch_info_ev.cycle_count), cc_freq_hz);
    5858                 survey->time_busy = div_u64(le32_to_cpu(ch_info_ev.rx_clear_count),
    5859                                             cc_freq_hz);

What's the point of using div_u64() on u32 variables?

    5860         }
    5861 exit:
    5862         spin_unlock_bh(&ar->data_lock);
    5863         rcu_read_unlock();
    5864 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
